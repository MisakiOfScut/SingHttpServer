#ifndef __EPOLL_H
#define __EPOLL_H_
#include <assert.h>
#include <unistd.h>
#include <sys/epoll.h>
#include <vector>
#include <memory>

namespace sing
{
/* 封装基本的epoll操作 */
class Epoll
{
public:
    static const int MAX_EVENT = 1024;

    Epoll();
    ~Epoll();
    bool addFd(int fd, uint32_t events);
    bool modFd(int fd, uint32_t events);
    bool delFd(int fd);
    int wait(int timeoutMs = -1);
    int getEventFd(int index) const;
    uint32_t getEvents(int index) const;

private:
    int epollFd;
    std::vector<struct epoll_event> eventsList;//use to contains triggered events by epoll_wait
};   

}

#endif
