#ifndef __THREADPOOL_H__
#define __THREADPOOL_H__
#include <mutex>
#include <queue>
#include <condition_variable>
#include <functional>
#include <thread>
#include <assert.h>

namespace sing
{

class ThreadPool
{
public:
    explicit ThreadPool(int thread_num)
        :pool_(std::make_shared<poolData>()){
        assert(thread_num>0);
        for (size_t i = 0; i < thread_num; i++)
        {
            std::thread([pool = pool_] {//[]中将s_ptr交由线程的s_ptr对象托管
                std::unique_lock<std::mutex> lock(pool->mutex);
                while (1)
                {
                    if (!pool->tasksQueue.empty())//判断是否有工作，避免假唤醒
                    {
                        auto task = std::move(pool->tasksQueue.front());//使用move调用移动构造函数赋值，避免一次copy
                        pool->tasksQueue.pop();
                        lock.unlock();//释放锁使得其他线程进入临界区
                        task();//执行工作
                        lock.lock();//执行完后尝试获取锁，为下一次循环访问临界区做准备

                    }else if (pool->running==false)
                    {
                        break;

                    }else
                    {
                        pool->cond.wait(lock);//没有工作时释放锁并
                    }
                }
                /*与上面的做法相比，这个循环会重复创建锁和func对象造成浪费
                while(1) {
                    function<void()> func;
                    {
                        std::unique_lock<std::mutex> lock(lock_);    
                        while(!stop_ && jobs_.empty())
                            cond_.wait(lock);
                        if(jobs_.empty() && stop_) {
                            return;
                        }
                        // if(!jobs_.empty()) {
                        func = jobs_.front();
                        jobs_.pop();
                        // }
                    }
                    if(func)func();
                }
                */
        }).detach();
        }
    }

    ~ThreadPool(){//pool_对象是线程池的成员，池析构时会调用pool对象的析构，这里表现为减少智能指针的引用计数
        if ((bool)pool_)
        {
            std::lock_guard<std::mutex> lock(pool_->mutex);
            pool_->running = false;
        }
        pool_->cond.notify_all();
    }
    ThreadPool()=default;
    ThreadPool(ThreadPool&&) = default;

    template<class F> void pushTask(F&& task){
        {
            std::lock_guard<std::mutex> lock(pool_->mutex);
            pool_->tasksQueue.emplace(std::forward<F>(task));//使用forward完美转发，保持task原有的右值特征
        }
        pool_->cond.notify_one();;
    }

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