#ifndef __HTTPCONTEXT_H__
#define __HTTPCONTEXT_H__
#include "HttpRequest.h"
#include "HttpResponse.h"
#include "../Buffer/Buffer.h"

namespace sing
{

class HttpContext
{
public:
    enum HttpRequestParseState
    {
        REQUEST_LINE,
        HEADERS,
        BODY,
        FINSH
    };

    bool parseRequest();
    bool parseFinsh();

    /*
        一、用hash表记录fd和userdata的对应关系，epoll的event的data中存fd
        二、用户数据记录其对应的fd，event的data存指向用户数据的ptr
        采用了第二种做法
    */
    int getFd(){ return fd; }
    void setFd(int fd){ assert(fd>=0); this->fd = fd; }
    Buffer& getInput(){ return input; }
    Buffer& getOutput(){ return output; }
    HttpRequest& getRequest(){ return request;}

    int read(int *savedErrno){ return input.readFd(fd,savedErrno);}
    int write(int *savedErrno){ return output.writeFd(fd,savedErrno);}//FIX ME: can a file write to socket without buffer

    void reset();
    void setWorking() { working = true; }
    void setNoWorking() { working = false; }
    bool isWorking() const { return working; }


    HttpContext(int);
    ~HttpContext();

private:
    bool parseRequestLine(const char* begin, const char* end);

private:
    int fd;
    bool working;
    Buffer input;
    Buffer output;
    HttpRequestParseState state;
    HttpRequest request;
    //HttpResponse response;
};


}

#endif // !__HTTPCONTEXT_H__