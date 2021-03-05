# 查找 GTest 库
find_package(GTest REQUIRED)
# GTest 的头文件
include(GoogleTest)
#include_directories(${GTEST_INCLUDE_DIRS})

add_executable(Buffer_test ../src/Buffer/Buffer.cpp Buffer_test.cpp GTestAll.cpp)
add_executable(Threadpool_test Threadpool_test.cpp GTestAll.cpp)
add_executable(Timer_test Timer_test.cpp ../src/Timer/TimerManager.cpp ../src/Http/HttpContext.cpp ../src/Http/HttpResponse.cpp ../src/Buffer/Buffer.cpp GTestAll.cpp)
add_executable(HttpRequest_test ../src/Http/HttpContext.cpp ../src/Http/HttpResponse.cpp ../src/Buffer/Buffer.cpp HttpRequest_test.cpp GTestAll.cpp)
add_executable(Response_test ../src/Http/HttpContext.cpp ../src/Http/HttpResponse.cpp ../src/Buffer/Buffer.cpp Response_test.cpp GTestAll.cpp)
add_executable(Server_test ../src/Http/HttpContext.cpp ../src/Http/HttpResponse.cpp ../src/Http/HttpServer.cpp
../src/Timer/TimerManager.cpp ../src/Buffer/Buffer.cpp ../src/Epoll/Epoll.cpp
Server_test.cpp GTestAll.cpp)


# 链接测试库
target_link_libraries(Buffer_test ${GTEST_BOTH_LIBRARIES} pthread )
target_link_libraries(Threadpool_test ${GTEST_BOTH_LIBRARIES} pthread )
target_link_libraries(Timer_test ${GTEST_BOTH_LIBRARIES} pthread )
target_link_libraries(HttpRequest_test ${GTEST_BOTH_LIBRARIES} pthread)
target_link_libraries(Response_test ${GTEST_BOTH_LIBRARIES} pthread)
target_link_libraries(Server_test ${GTEST_BOTH_LIBRARIES} pthread)

# 添加到测试
gtest_discover_tests(Timer_test)