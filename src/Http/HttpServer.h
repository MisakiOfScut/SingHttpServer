#ifndef __HTTPSERVER_H__
#define __HTTPSERVER_H__
#include <memory>
#include <string>

namespace sing
{
using std::unique_ptr;
class ThreadPool;
class Epoll;
class TimerManager;
class HttpContext;

class HttpServer
{
public:
    static const std::string srcDir;

    int createListenFd();
    int setNonblocking(int fd);
    void acceptConnection();
    void closeConnection(HttpContext*);
    void doRequest(HttpContext*);
    void doResponse(HttpContext*);
    void start();
    HttpServer(int port, int thread_num, int timeout);
    ~HttpServer();

private:
    int port;
    int listenfd;
    int timeout;

    unique_ptr<ThreadPool> threadPool;
    unique_ptr<TimerManager> timerManager;
    unique_ptr<Epoll> epoller;
};

}

#endif // !__HTTPSERVER_H__