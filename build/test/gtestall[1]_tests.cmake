add_test( buffer_test_case1.buffer_test /home/pc/wws/SingHttpServer/build/test/gtestall [==[--gtest_filter=buffer_test_case1.buffer_test]==] --gtest_also_run_disabled_tests)
set_tests_properties( buffer_test_case1.buffer_test PROPERTIES WORKING_DIRECTORY /home/pc/wws/SingHttpServer/build/test)
add_test( testBufferGrow.buffer_test /home/pc/wws/SingHttpServer/build/test/gtestall [==[--gtest_filter=testBufferGrow.buffer_test]==] --gtest_also_run_disabled_tests)
set_tests_properties( testBufferGrow.buffer_test PROPERTIES WORKING_DIRECTORY /home/pc/wws/SingHttpServer/build/test)
add_test( testBufferInsideGrow.buffer_test /home/pc/wws/SingHttpServer/build/test/gtestall [==[--gtest_filter=testBufferInsideGrow.buffer_test]==] --gtest_also_run_disabled_tests)
set_tests_properties( testBufferInsideGrow.buffer_test PROPERTIES WORKING_DIRECTORY /home/pc/wws/SingHttpServer/build/test)
add_test( testBufferFindEOL.buffer_test /home/pc/wws/SingHttpServer/build/test/gtestall [==[--gtest_filter=testBufferFindEOL.buffer_test]==] --gtest_also_run_disabled_tests)
set_tests_properties( testBufferFindEOL.buffer_test PROPERTIES WORKING_DIRECTORY /home/pc/wws/SingHttpServer/build/test)
add_test( threadpool_test_rvalue.threadpool_test /home/pc/wws/SingHttpServer/build/test/gtestall [==[--gtest_filter=threadpool_test_rvalue.threadpool_test]==] --gtest_also_run_disabled_tests)
set_tests_properties( threadpool_test_rvalue.threadpool_test PROPERTIES WORKING_DIRECTORY /home/pc/wws/SingHttpServer/build/test)
add_test( threadpool_test_bind.threadpool_test /home/pc/wws/SingHttpServer/build/test/gtestall [==[--gtest_filter=threadpool_test_bind.threadpool_test]==] --gtest_also_run_disabled_tests)
set_tests_properties( threadpool_test_bind.threadpool_test PROPERTIES WORKING_DIRECTORY /home/pc/wws/SingHttpServer/build/test)
add_test( threadpool_test_current.threadpool_test /home/pc/wws/SingHttpServer/build/test/gtestall [==[--gtest_filter=threadpool_test_current.threadpool_test]==] --gtest_also_run_disabled_tests)
set_tests_properties( threadpool_test_current.threadpool_test PROPERTIES WORKING_DIRECTORY /home/pc/wws/SingHttpServer/build/test)
set( gtestall_TESTS buffer_test_case1.buffer_test testBufferGrow.buffer_test testBufferInsideGrow.buffer_test testBufferFindEOL.buffer_test threadpool_test_rvalue.threadpool_test threadpool_test_bind.threadpool_test threadpool_test_current.threadpool_test)