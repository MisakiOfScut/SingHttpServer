#include "../src/Http/HttpContext.h"
#include "../src/Http/HttpResponse.h"
#include "../src/Http/HttpServer.h"
#include <gtest/gtest.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
using namespace sing;

TEST(Response_test, test_make200Resp){
    int testFile = open("testfile-2.html", O_WRONLY);
    ASSERT_GE(testFile,0);
    HttpContext *context = new HttpContext(testFile);
    string s("GET /index.html HTTP/1.1\r\n"
                "Host: www.wws.com\r\n"
                "\r\n");
    context->getInput()->append(s);
    ASSERT_TRUE(context->parseRequest());
    ASSERT_TRUE(context->parseFinsh());

    HttpResponse* response = context->getResponse();
    response->setFilePath("../../webapps",context->getRequest()->getPath());
    response->makeResponse(HttpResponse::Code200_Ok, false);
    response->appendToBuffer(context->getOutput());
    
    HttpServer server(8000,1,10000);
    server.doResponse(context);

    // int total = context->getOutput().readableBytes();

    // int saveErrno;
    // int ret = context->write(response.getFile(),response.getFileSize(), &saveErrno);
    // ASSERT_EQ(total + response.getFileSize(), ret);
}