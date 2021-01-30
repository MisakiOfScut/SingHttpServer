#include "../src/Timer/TimerManager.h"
#include <gtest/gtest.h>
#include <iostream>
using namespace sing;
using std::cout ;
using std::endl;

void print(){
    cout<<"125414"<<endl;
}
TEST(timer_test, test_timer){
    TimeStamp now = Clock::now();
    Timer t(0, now, std::bind(print));
    ASSERT_EQ(t.getExpireTime(), now);
    ASSERT_EQ(t.getFd(),0);

    t.exec();
    t.del();
    ASSERT_TRUE(t.isDel());
    t.reset(10,std::bind(print));
    ASSERT_FALSE(t.isDel());

}
TEST(timer_test, test_timer_reset){
    Timer t(0, Clock::now(), std::bind(print));

    t.reset(10);
    TimeStamp exptime = Clock::now()+MS(10);
    ASSERT_GE(exptime, t.getExpireTime());

    t.reset(10,std::bind(print)); 
    exptime = Clock::now()+MS(10);
    ASSERT_GE(exptime, t.getExpireTime());
}
TEST(timer_manager_test, test_time_manager_basic){
    TimerManager tm;
    tm.addTimer(0, 10, std::bind(print));
    ASSERT_LE(tm.getNextTimeout(), 10);

    tm.updTimer(0, 20);
    ASSERT_GE(tm.getNextTimeout(),10);

    tm.delTimer(0);
    ASSERT_EQ(-1, tm.getNextTimeout());//and shouldn't call print!!!
}

void print1(int i){
    cout<<i<<'\t';
}
TEST(timer_manager_test, test_tick){
    TimerManager tm;
    for (size_t i = 0; i < 5; i++)
    {
        tm.addTimer(i, -1, std::bind(print1,i));
    }
    tm.tick();//should print 0 1 2 3 4
}