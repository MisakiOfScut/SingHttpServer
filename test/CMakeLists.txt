# 查找 GTest 库
find_package(GTest REQUIRED)
# GTest 的头文件
include(GoogleTest)
#include_directories(${GTEST_INCLUDE_DIRS})

add_executable(gtestall Buffer_test.cpp GTestAll.cpp)

# 链接测试库
target_link_libraries( gtestall ${GTEST_BOTH_LIBRARIES} pthread )

# 添加到测试
gtest_discover_tests(gtestall)