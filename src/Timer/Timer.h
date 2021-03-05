#ifndef __TIMER_H__
#define __TIMER_H__
#include <functional>
#include <chrono>
#include <iostream>
#include <memory>

namespace sing
{
class Timer;
using Clock = std::chrono::high_resolution_clock;
using MS = std::chrono::milliseconds;
using TimeStamp = Clock::time_point;
using Sha_Timer = std::shared_ptr<Timer>;

class Timer
{
public:
    Timer(const TimeStamp& expire_time, const std::function<void()>& callback)
        :expireTime(expire_time), callback(callback), close(false){};
    
    Timer(const Timer& t):expireTime(Clock::now()), callback(t.callback),close(true){};
    TimeStamp getExpireTime(){
        return expireTime;
    }
    //reset expireTime, arg timeout is how long it'll expire
    void reset(int timeout){
        this->expireTime = Clock::now()+MS(timeout);
        close = false;
    }
    void reset(int timeout, const std::function<void()>& callback){
        this->callback = callback;
        reset(timeout);
    }
    void del(){ /*this->callback = nullptr;*/close = true; }//clearing assignment
    bool isDel(){ return close; /*callback ? true:false;*/ }//check if callable
    void exec(){ //执行定时任务，必须先检查是否可调用
        callback(); 
    };

private:
    std::function<void()> callback;//timeout callback
    TimeStamp expireTime;
    bool close;
};


}

#endif // !__TIMER_H__