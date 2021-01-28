#include "../src/ThreadPool/ThreadPool.h"
#include <gtest/gtest.h>
using namespace sing;
using std::cout;
using std::endl;

class A{
public:
    A(){
        std::cout<<"cons"<<std::endl;
    }
    A(const A &a){
        std::cout<<"cp cons"<<std::endl;
    }
    void print(){
        std::cout<<std::this_thread::get_id()<<"  "<<a++<<std::endl;
    }
    private:
        int a = 0;
};
TEST(threadpool_test_rvalue, threadpool_test){
    ThreadPool pool(1);
    A a;
    for (size_t i = 0; i < 1; i++)
    {
        pool.pushTask([&](){//catch obj a by ref, its cp cons shouldn't be called!
            a.print();
        });
    }
    sleep(1);
}

TEST(threadpool_test_bind, threadpool_test){
    ThreadPool pool(1);
    A a_obj;
    cout<<"main ";
    a_obj.print();
    pool.pushTask(std::bind(&A::print, &a_obj));
    sleep(1);
}
void SL(int i){
    cout<<std::this_thread::get_id()<<"\t"<<i<<endl;
}
TEST(threadpool_test_current, threadpool_test){
    ThreadPool pool(4);
    for (size_t i = 0; i < 10; i++)
    {
        pool.pushTask(std::bind(SL,i));
    }
    sleep(1);
}