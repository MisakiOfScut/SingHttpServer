cmake_minimum_required(VERSION 3.0.0)
project(SingHttpServer VERSION 0.1.0)

include_directories(${PROJECT_SOURCE_DIR}/src)
enable_testing()

add_executable(main main.cpp src/Http/HttpContext.cpp src/Http/HttpResponse.cpp src/Http/HttpServer.cpp
src/Buffer/Buffer.cpp src/Timer/TimerManager.cpp src/Epoll/Epoll.cpp)

target_link_libraries(main pthread)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

add_subdirectory(test)