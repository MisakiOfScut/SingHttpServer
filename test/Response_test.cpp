#include "../src/Http/HttpContext.h"
#include "../src/Http/HttpResponse.h"
#include <gtest/gtest.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
using namespace sing;

TEST(Response_test, test_makeErrResp){
    //！！！！！！！！！！文件路径是相对于可执行文件的！！！！！！！！！！
    int testFile = open("testfile.md", O_WRONLY);
    ASSERT_GE(testFile,0);
    HttpContext *context = new HttpContext(testFile);
    string s("GET /index.html HTTP/1.1\r\n"
                "Host: www.wws.com\r\n"
                "\r\n");
    context->getInput()->append(s);
    ASSERT_EQ(context->getInput()->findCRLF(),context->getInput()->peek()+24);

    ASSERT_TRUE(context->parseRequest());
    ASSERT_TRUE(context->parseFinsh());

    HttpResponse *response = context->getResponse();
    response->makeResponse(HttpResponse::Code400_BadRequest, true);
    response->appendToBuffer(context->getOutput());

    int total = context->getOutput()->readableBytes();

    int saveErrno;
    int ret = context->write(&saveErrno);
    ASSERT_EQ(total, ret);
}

TEST(Response_test, test_make200Resp){
    int testFile = open("testfile-1.md", O_WRONLY);
    ASSERT_GE(testFile,0);
    HttpContext *context = new HttpContext(testFile);
    string s("GET /testfile.md HTTP/1.1\r\n"
                "Host: www.wws.com\r\n"
                "\r\n");
    context->getInput()->append(s);
    ASSERT_EQ(context->getInput()->findCRLF(),context->getInput()->peek()+25);
    ASSERT_TRUE(context->parseRequest());
    ASSERT_TRUE(context->parseFinsh());

    HttpResponse *response = context->getResponse();
    response->setFilePath(".",context->getRequest()->getPath());
    response->makeResponse(HttpResponse::Code200_Ok, false);
    response->appendToBuffer(context->getOutput());

    int total = context->getOutput()->readableBytes();

    int saveErrno;
    int ret = context->write(response->getFile(),response->getFileSize(), &saveErrno);
    ASSERT_EQ(total + response->getFileSize(), ret);
}