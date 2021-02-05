#include "Epoll.h"
using namespace sing;

Epoll::Epoll()
    :epollFd(epoll_create1(EPOLL_CLOEXEC)),
     eventsList(MAX_EVENT)
{
    assert(epollFd >= 0 && eventsList.size()>0);
}

Epoll::~Epoll(){
    close(epollFd);
}

bool Epoll::addFd(int fd, HttpContext* context, uint32_t events){
    if(fd < 0) return false;
    epoll_event ev = {0};
    ev.data.ptr = context;
    ev.events = events;
    return 0 == epoll_ctl(epollFd, EPOLL_CTL_ADD, fd, &ev);
}

bool Epoll::modFd(int fd, HttpContext* context, uint32_t events){
    if(fd < 0) return false;
    epoll_event ev = {0};
    ev.data.ptr = context;
    ev.events = events;
    return 0 == epoll_ctl(epollFd, EPOLL_CTL_MOD, fd, &ev);
}

bool Epoll::delFd(int fd){
    if(fd < 0) return false;
    epoll_event ev = {0};
    return 0 == epoll_ctl(epollFd, EPOLL_CTL_DEL, fd, &ev);
}

int Epoll::wait(int timeoutMs){
    return epoll_wait(epollFd, &eventsList[0], static_cast<int>(eventsList.size()), timeoutMs);
}

uint32_t Epoll::getEvents(int index) const{
    assert(index>=0 && index<eventsList.size());
    return eventsList[index].events;
}

HttpContext* Epoll::getDataPtr(int index){
    return static_cast<HttpContext*>(eventsList[index].data.ptr);
}