#include "../src/Http/HttpContext.h"
#include <gtest/gtest.h>
#define BOOST_CHECK_EQUAL(val1, val2)  ASSERT_EQ(val1, val2)
using namespace sing;
using std::endl;
using std::cout;

TEST(HttpRequest_test,test_parse){
    HttpContext context(0);
    string s("GET /index.html HTTP/1.1\r\n"
                "Host: www.wws.com\r\n"
                "\r\n");
    context.getInput().append(s);
    ASSERT_EQ(context.getInput().findCRLF(),context.getInput().peek()+24);

    ASSERT_TRUE(context.parseRequest());
    ASSERT_TRUE(context.parseFinsh());

    const HttpRequest& request = context.getRequest();
    BOOST_CHECK_EQUAL(request.getMethod(), HttpRequest::Get);
    BOOST_CHECK_EQUAL(request.getPath(), string("/index.html"));
    BOOST_CHECK_EQUAL(request.getVersion(), HttpRequest::HTTP11);
    BOOST_CHECK_EQUAL(request.getHeaders("Host"), string("www.wws.com"));
    BOOST_CHECK_EQUAL(request.getHeaders("User-Agent"), string(""));
}

TEST(HttpRequest_test,test_parse_in_2pieces){
    string s("GET /index.html HTTP/1.1\r\n"
                "Host: www.wws.com\r\n"
                "\r\n");
    for(size_t s1=0;s1<s.size();++s1){
        HttpContext context(0);
        context.getInput().append(s.c_str(),s1);
        ASSERT_TRUE(context.parseRequest());
        ASSERT_FALSE(context.parseFinsh());

        size_t s2 = s.size()-s1;
        context.getInput().append(s.c_str()+s1,s2);
        ASSERT_TRUE(context.parseRequest());
        ASSERT_TRUE(context.parseFinsh());
        const HttpRequest& request = context.getRequest();
        BOOST_CHECK_EQUAL(request.getMethod(), HttpRequest::Get);
        BOOST_CHECK_EQUAL(request.getPath(), string("/index.html"));
        BOOST_CHECK_EQUAL(request.getVersion(), HttpRequest::HTTP11);
        BOOST_CHECK_EQUAL(request.getHeaders("Host"), string("www.wws.com"));
        BOOST_CHECK_EQUAL(request.getHeaders("User-Agent"), string(""));                
    }
}

TEST(HttpRequest_test,test_empty_headers){
    HttpContext context(0);
    string s("GET /index.html HTTP/1.0\r\n"
                "Host: www.wws.com\r\n"
                "User-agent:\r\n"
                "\r\n");
    context.getInput().append(s);
    ASSERT_EQ(context.getInput().findCRLF(),context.getInput().peek()+24);

    ASSERT_TRUE(context.parseRequest());
    ASSERT_TRUE(context.parseFinsh());

    const HttpRequest& request = context.getRequest();
    BOOST_CHECK_EQUAL(request.getMethod(), HttpRequest::Get);
    BOOST_CHECK_EQUAL(request.getPath(), string("/index.html"));
    BOOST_CHECK_EQUAL(request.getVersion(), HttpRequest::HTTP10);
    BOOST_CHECK_EQUAL(request.getHeaders("Host"), string("www.wws.com"));
    BOOST_CHECK_EQUAL(request.getHeaders("User-Agent"), string(""));
}