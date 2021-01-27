#include "ThreadPool.h"
#include <assert.h>
using namespace sing;

ThreadPool::ThreadPool(size_t thread_num)
    :pool_(std::make_shared<poolData>())
{
    assert(thread_num>0);
    for (size_t i = 0; i < thread_num; i++)
    {
        std::thread([pool = pool_] {//[]中将s_ptr交由线程的s_ptr对象托管
            std::unique_lock<std::mutex> lock(pool->mutex);
            while (1)
            {
                if (!pool->tasksQueue.empty())//判断是否有工作，避免假唤醒
                {
                    auto task = pool->tasksQueue.front();
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

ThreadPool::~ThreadPool(){//pool_对象是线程池的成员，池析构时会调用pool对象的析构，这里表现为减少智能指针的引用计数
    if ((bool)pool_)
    {
        std::lock_guard<std::mutex> lock(pool_->mutex);
        pool_->running = false;
    }
    pool_->cond.notify_all();
}

template<class F>
void ThreadPool::pushTask(F&& task){
    {
        std::lock_guard<std::mutex> lock(pool_->mutex);
        pool_->tasksQueue.emplace(std::forward<F> task);
    }
    pool_->cond.notify_one();;
}