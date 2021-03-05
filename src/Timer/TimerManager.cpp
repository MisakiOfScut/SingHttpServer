#include "TimerManager.h"
using namespace sing;

void TimerManager::addTimer(HttpContext* context, int timeout, const std::function<void()>& callback){
    assert(context!=nullptr);
    Sha_Timer timer = std::make_shared<Timer>(Clock::now()+MS(timeout),callback);
    timerQueue.push(timer);
    context->clearTimer();
    context->setTimer(timer);
}

// void TimerManager::updTimer(HttpContext* context, int timeout){
//     assert(context!=nullptr);
//     if(context-> getTimer() != nullptr){
//         context->getTimer()->reset(timeout);
//     }
// }

// //use lazy delete a timer
// void TimerManager::delTimer(HttpContext* context){
//     assert(context!=nullptr);
//     if(context-> getTimer() != nullptr){
//         context->getTimer()->del();
//     }
// }

int TimerManager::getNextTimeout(){
    int res = -1;//-1 means no timeout
    while (!timerQueue.empty())
    {
        Sha_Timer t = timerQueue.top();
        assert(t!=nullptr);
        if(t->isDel()){
            timerQueue.pop();
            continue;
        }
        res = std::chrono::duration_cast<MS>(t->getExpireTime() - Clock::now()).count();
        res = res<0? 0 : res;
        break;
    }
    return res;
}

void TimerManager::tick(){
    while (!timerQueue.empty())
    {
        Sha_Timer t = timerQueue.top();
        assert(t!=nullptr);
        if(t->isDel()){
            timerQueue.pop();
            continue;
        }
        //exit if top timer isn't expire
        if(std::chrono::duration_cast<MS>(t->getExpireTime() - Clock::now()).count()>0){
            break;
        }
        t->exec();//timeout, exec timeout work
        timerQueue.pop();
    }
}

TimerManager::~TimerManager(){
    // for(auto it : map)//STL容器只会删除ptr，ptr指向的对象需要手动销毁，否则会内存不会释放
    // {
    //     delete it.second;
    //     it.second = NULL;
    // }
    // while (!timerQueue.empty()){
    //     timerQueue.pop();
    // }
}