#ifndef __THREADPOOL_H__
#define __THREADPOOL_H__
#include <mutex>
#include <queue>
#include <condition_variable>
#include <functional>
#include <thread>

namespace sing
{

class ThreadPool
{
public:
    ThreadPool(size_t thread_num);
    ~ThreadPool();

    template<class F>
    void pushTask(F&& task);
    
private:
    struct poolData
    {
        std::mutex mutex;
        std::condition_variable cond;
        std::queue<std::function<void()>> tasksQueue;
        bool running;
    };
    std::shared_ptr<poolData> pool_;//用共享指针使得所有线程共享一份数据    
};

}

#endif