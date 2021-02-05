#ifndef __TIMERMANAGER_H__
#define __TIMERMANAGER_H__
#include "Timer.h"
#include <queue>
#include <unordered_map>
#include <assert.h>

namespace sing{

struct cmp
{
    bool operator() (Timer* a, Timer* b){
        assert(a!=nullptr && b!=nullptr);
        return (a->getExpireTime()) > (b->getExpireTime());
    }
};
using TimerQueue = std::priority_queue<Timer*, std::vector<Timer*>, cmp>;

class TimerManager
{
public:
    void addTimer(int fd, int timeout, const std::function<void()>& callback);
    void delTimer(int fd);
    void updTimer(int fd,int timeout);
    void tick();//handle expire timers
    int getNextTimeout();
    ~TimerManager(); 

private:
    TimerQueue timerQueue;
    //hashmap(fd, timer)
    std::unordered_map<int, Timer*> map;//FIX ME : use unique_ptr
};

}
#endif // !__TIMERMANAGER_H__

/* 处理逻辑是这样的~
因为(1) 优先队列不支持随机访问
(2) 即使支持，随机删除某节点后破坏了堆的结构，需要重新更新堆结构。
所以对于被置为deleted的时间节点，会延迟到它(1)超时 或
(2)它前面的节点都被删除时，它才会被删除。
一个点被置为deleted,它最迟会在TIMER_TIME_OUT时间后被删除。
这样做有两个好处：
(1) 第一个好处是不需要遍历优先队列，省时。
(2)第二个好处是给超时时间一个容忍的时间，就是设定的超时时间是删除的下限(并不是一到超时时间就立即删除)，如果监听的请求在超时后的下一次请求中又一次出现了，
就不用再重新申请RequestData节点了，这样可以继续重复利用前面的RequestData，减少了一次delete和一次new的时间。
*/