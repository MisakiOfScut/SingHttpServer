#include "TimerManager.h"
using namespace sing;

void TimerManager::addTimer(int fd, int timeout, const std::function<void()>& callback){
    assert(fd>=0);
    Timer *t;
    if (map.count(fd)==0)
    {
        /*dev: if callback is NULL, it's it still meaningful to keep its timer?*/

        t = new Timer(fd, Clock::now()+MS(timeout), callback);
        timerQueue.push(t);
        map[fd] = t;

    }else//when timer is existed
    {
        t = map[fd];
        assert(t!=nullptr);
        t->reset(timeout, callback);
    }
}

void TimerManager::updTimer(int fd, int timeout){
    Timer* t = map[fd];
    assert(t!=nullptr);
    t->reset(timeout);
}

//use lazy delete a timer
void TimerManager::delTimer(int fd){
    Timer* t = map[fd];
    t->del();//just set the callback NULL
}

int TimerManager::getNextTimeout(){
    int res = -1;//-1 means no timeout
    while (!timerQueue.empty())
    {
        Timer* t = timerQueue.top();
        assert(t!=nullptr);
        if(t->isDel()){
            timerQueue.pop();
            map.erase(t->getFd());
            delete t;
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
        Timer* t = timerQueue.top();
        assert(t!=nullptr);
        if(t->isDel()){
            timerQueue.pop();
            map.erase(t->getFd());
            delete t;
            continue;
        }

        //exit if top timer isn't expire
        if(std::chrono::duration_cast<MS>(t->getExpireTime() - Clock::now()).count()>0){
            break;
        }

        t->exec();//timeout, exec timeout work
        timerQueue.pop();
        map.erase(t->getFd());
        delete t;
    }
}

TimerManager::~TimerManager(){
    for(auto it : map)//STL容器只会删除ptr，ptr指向的对象需要手动销毁，否则会内存不会释放
    {
        delete it.second;
        it.second = NULL;
    }
    map.clear();
}