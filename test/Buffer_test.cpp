#include <gtest/gtest.h>
#include <string>
#include "../src/Buffer/Buffer.h"
#define BOOST_CHECK_EQUAL(val1, val2)  ASSERT_EQ(val1, val2)
using namespace sing;
using std::string;

TEST(buffer_test_case1,buffer_test){
    Buffer buf;
    ASSERT_EQ(buf.readableBytes(),0);
    ASSERT_EQ(buf.writableBytes(),1024);
    ASSERT_EQ(buf.prependableBytes(),0);

    const std::string str(200, 'x');
    buf.append(str);
    ASSERT_EQ(buf.readableBytes(), str.size());
    ASSERT_EQ(buf.writableBytes(), 1024 - str.size());
    ASSERT_EQ(buf.prependableBytes(), 0);
}

TEST(testBufferGrow,buffer_test)
{
    Buffer buf;
    buf.append(std::string(400, 'y'));
    BOOST_CHECK_EQUAL(buf.readableBytes(), 400);
    BOOST_CHECK_EQUAL(buf.writableBytes(), 1024-400);

    buf.retrieve(50);
    BOOST_CHECK_EQUAL(buf.readableBytes(), 350);
    BOOST_CHECK_EQUAL(buf.writableBytes(), 1024-400);
    BOOST_CHECK_EQUAL(buf.prependableBytes(), 50);

    buf.append(string(1000, 'z'));
    BOOST_CHECK_EQUAL(buf.readableBytes(), 1350);
    BOOST_CHECK_EQUAL(buf.writableBytes(), 0);
    BOOST_CHECK_EQUAL(buf.prependableBytes(), 50); // FIXME

    buf.retrieveAll();
    BOOST_CHECK_EQUAL(buf.readableBytes(), 0);
    BOOST_CHECK_EQUAL(buf.writableBytes(), 1400); // FIXME
    BOOST_CHECK_EQUAL(buf.prependableBytes(), 0);
}

TEST(testBufferInsideGrow,buffer_test)
{
    Buffer buf;
    buf.append(std::string(800, 'y'));
    BOOST_CHECK_EQUAL(buf.readableBytes(), 800);
    BOOST_CHECK_EQUAL(buf.writableBytes(), 1024-800);

    buf.retrieve(500);
    BOOST_CHECK_EQUAL(buf.readableBytes(), 300);
    BOOST_CHECK_EQUAL(buf.writableBytes(), 1024-800);
    BOOST_CHECK_EQUAL(buf.prependableBytes(), 500);

    buf.append(std::string(300, 'z'));
    BOOST_CHECK_EQUAL(buf.readableBytes(), 600);
    BOOST_CHECK_EQUAL(buf.writableBytes(), 1024-600);
    BOOST_CHECK_EQUAL(buf.prependableBytes(), 0);
}

TEST(testBufferFindEOL,buffer_test)
{
    Buffer buf;
    buf.append(std::string(100000, 'x'));
    const char* null = NULL;
    ASSERT_EQ(buf.findLF(), null);
    ASSERT_EQ(buf.findLF(buf.peek()+90000), null);
}

// void output(Buffer&& buf, const void* inner)
// {
//   Buffer newbuf(std::move(buf));
//   // printf("New Buffer at %p, inner %p\n", &newbuf, newbuf.peek());
//   ASSERT_EQ(inner, newbuf.peek());
// }

// // NOTE: This test fails in g++ 4.4, passes in g++ 4.6.
// TEST(testMove,buffer_test)
// {
//   Buffer buf;
//   buf.append("sing", 4);
//   const void* inner = buf.peek();
//   // printf("Buffer at %p, inner %p\n", &buf, inner);
//   output(std::move(buf), inner);
// }