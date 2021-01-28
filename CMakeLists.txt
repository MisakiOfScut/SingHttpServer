cmake_minimum_required(VERSION 3.0.0)
project(SingHttpServer VERSION 0.1.0)

include_directories(${PROJECT_SOURCE_DIR}/src)
enable_testing()

add_executable(main main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

add_subdirectory(test)