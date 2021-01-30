#ifndef __TIMER_H__
#define __TIMER_H__
#include <functional>
#include <chrono>
#include <iostream>

namespace sing
{
using Clock = std::chrono::high_resolution_clock;
using MS = std::chrono::milliseconds;
using TimeStamp = Clock::time_point;

class Timer
{
public:
    Timer(int fd, const TimeStamp& expire_time, const std::function<void()>& callback)
        :fd(fd), expireTime(expire_time), callback(callback){};
    TimeStamp getExpireTime(){
        return expireTime;
    }
    //reset expireTime, arg timeout is how long it'll expire
    void reset(int timeout){
        this->expireTime = Clock::now()+MS(timeout);
    }
    void reset(int timeout, const std::function<void()>& callback){
        this->expireTime = Clock::now()+MS(timeout);
        this->callback = callback;
    }
    void del(){ this->callback = NULL; }
    bool isDel(){ return callback==NULL?true:false; }
    int getFd(){ return fd; }
    void exec(){ //执行定时任务，不需要判空空函数不会异常
        callback(); 
    };

private:
    std::function<void()> callback;//timeout callback
    TimeStamp expireTime;
    int fd;
};


}

#endif // !__TIMER_H__