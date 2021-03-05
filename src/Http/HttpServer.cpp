#include "HttpServer.h"
#include "HttpContext.h"
#include "../ThreadPool/ThreadPool.h"
#include "../Timer/TimerManager.h"
#include "../Epoll/Epoll.h"
#include <assert.h>
#include <functional>
#include <sys/socket.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <fcntl.h>

using namespace sing;

const std::string HttpServer::srcDir = "../webapps";//与exec文件同级

HttpServer::HttpServer(int port, int thread_num, int time_out)
    :port(port)
    ,listenfd(createListenFd())
    ,timeout(time_out)
    ,epoller(new Epoll())
    ,threadPool(new ThreadPool(thread_num))
    ,timerManager(new TimerManager())
{
    assert(listenfd>=0);
}

HttpServer::~HttpServer(){
    close(listenfd);
}

void HttpServer::start(){
    HttpContext *listenContext = new HttpContext(listenfd);
    assert(epoller->addFd(listenfd, listenContext, (EPOLLIN | EPOLLET))==true);

    int timeMs;
    while (1)
    {
        timeMs = timerManager->getNextTimeout();
        int ev_num = epoller->wait(timeMs);
        for (int i = 0; i < ev_num; ++i)
        {
            HttpContext* context = epoller->getDataPtr(i); //maybe NULL
            uint32_t events = epoller->getEvents(i);
            int fd = context->getFd();

            if(fd==listenfd){
                acceptConnection();
            }
            else if(events & (EPOLLRDHUP | EPOLLHUP | EPOLLERR)){
                closeConnection(context);
            }
            else if(events & EPOLLIN){
                timerManager->addTimer(context, timeout, std::bind(&HttpServer::closeConnection, this, context));
                threadPool->pushTask(std::bind(&HttpServer::doRequest, this, context));
            }
            else if(events & EPOLLOUT){
                timerManager->addTimer(context, timeout, std::bind(&HttpServer::closeConnection, this, context));
                threadPool->pushTask(std::bind(&HttpServer::doResponse, this, context));
            }
            else{
                std::cout << "Epoll: Unexpected event" << std::endl;//FIX ME: Use log
            }
        }
        timerManager->tick();
    }
}

void HttpServer::acceptConnection(){
    while (1) //use ET
    {
        int acceptFd = accept4(listenfd, NULL, NULL, SOCK_NONBLOCK | SOCK_CLOEXEC);
        if(acceptFd == -1){
            if(errno!=EAGAIN)
                std::cout << "socket accept: "<< strerror(errno) << std::endl; // FIX ME: use log
            break;
        }
        HttpContext* context = new HttpContext(acceptFd);
        timerManager->addTimer(context, timeout, std::bind(&HttpServer::closeConnection, this, context));
        epoller->addFd(acceptFd, context, (EPOLLIN | EPOLLONESHOT));//EPOLLONESHOT让fd的事件只能被触发一个和一次，除非重置EPOLLONESHOT才能再次触发
    }
}

void HttpServer::closeConnection(HttpContext* context){
    int fd = context->getFd();
    context->clearTimer();//timerManager->delTimer(context);
    epoller->delFd(fd);
    delete context;// !!!
    context = nullptr;
}

//recv request and parse
void HttpServer::doRequest(HttpContext* context){
    assert(context!=NULL);
    //context->clearTimer();//timerManager->delTimer(context);   
    int readErrno;
    int ret = context->read(&readErrno);//采取LT模式，不需要循环读完

    if(ret==0 || (ret<0 && readErrno!=EAGAIN)){//client close conn || no EAGAIN err
        closeConnection(context);
        return;
    }
    else if(ret<0 && readErrno == EAGAIN){//read would block
        epoller->modFd(context->getFd(), context, (EPOLLIN | EPOLLONESHOT));//reset fd for next readable event
        //timerManager->addTimer(context, timeout, std::bind(&HttpServer::closeConnection, this, context));//reset timer
        //--------采取先del定时器，EAGAIN再添加回去的策略，如果能一次读完的情况多则效率高，否则堆的频繁变动反而效率低------//
        //timerManager->updTimer(context, timeout);
        return;
    }

    HttpResponse* response = context->getResponse();
    if(!context->parseRequest()){//parse reqst, close conn if err
        response->makeResponse(HttpResponse::Code400_BadRequest, true);
        response->appendToBuffer(context->getOutput());
    }else if(context->parseFinsh()){
        response->setFilePath(srcDir, context->getRequest()->getPath());
        response->makeResponse(HttpResponse::Code200_Ok, false);
        response->appendToBuffer(context->getOutput());
    }

    if(response->getFileSize()>0 && response->getFile()){
        context->getOutput()->setWriteFile(response->getFile(), response->getFileSize());
    }
    epoller->modFd(context->getFd(), context, (EPOLLOUT | EPOLLONESHOT));
}

//send response
void HttpServer::doResponse(HttpContext* context){
    assert(context!=NULL);
    int fd = context->getFd();
    HttpResponse* response = context->getResponse();
    //context->clearTimer();//timerManager->delTimer(context); 

    int writeErrno;
    int ret = context->writev(&writeErrno);

    if(context->getOutput()->writeAllFile()){
        if(context->keepAlive()){
            context->reset();
            //timerManager->addTimer(context, timeout, std::bind(&HttpServer::closeConnection, this, context));
            //timerManager->updTimer(context, timeout);
            epoller->modFd(fd, context, (EPOLLIN | EPOLLONESHOT));
            return;
        }
    }
    else {
    //else if(ret<0)
        // if(writeErrno==EAGAIN){
        //     epoller->modFd(fd, context, (EPOLLOUT | EPOLLONESHOT));
        //     return;
        // }
        //timerManager->addTimer(context, timeout, std::bind(&HttpServer::closeConnection, this, context));
        epoller->modFd(fd, context, (EPOLLOUT | EPOLLONESHOT));
        return;
    }
    closeConnection(context);
}

int HttpServer::createListenFd(){
    port = ((port <= 1024) || (port >= 65535)) ? 8000 : port;

    struct sockaddr_in address;
    bzero(&address, sizeof(address));
    address.sin_family = AF_INET;
    // inet_pton(AF_INET, ip, &address.sin_family);
    address.sin_addr.s_addr = htonl(INADDR_ANY);
    address.sin_port = htons(port);

    int sock = socket(PF_INET, SOCK_STREAM, 0);
    assert(sock>=0);

    int ret = bind(sock, (struct sockaddr*) &address, sizeof(address));
    assert(ret!=-1);

    ret = listen(sock, 1024);
    assert(ret!=-1);

    setNonblocking(sock);

    return sock;
}

int HttpServer::setNonblocking(int fd){
    // 获取套接字选项
    int flag = fcntl(fd, F_GETFL, 0);
    if(flag == -1) {
        printf("[Utils::setNonBlocking]fd = %d fcntl : %s\n", fd, strerror(errno));
        return -1;
    }
    // 设置非阻塞
    flag |= O_NONBLOCK;
    if(fcntl(fd, F_SETFL, flag) == -1) {
        printf("[Utils::setNonBlocking]fd = %d fcntl : %s\n", fd, strerror(errno));
        return -1;
    }
    return 0;
}