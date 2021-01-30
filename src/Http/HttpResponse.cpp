#include "HttpResponse.h"
#include "../Buffer/Buffer.h"
using namespace sing;

/*
    在获取报文体后再append到buffer，
    通过addHeader设置Content-length和Content-type
    如果body是文件则另外append，不要通过body设置避免一次copy
*/
void HttpResponse::appendToBuffer(Buffer* output) const{
    output->append("HTTP1.1 " + std::to_string(code) + " ");
    output->append(statusMessage);
    output->append("\r\n");

    if(closeConn){
        output->append("Connection: close\r\n");
    }else{
        output->append("Connection: keep-Alive\r\n");
        output->append("keep-Alive: timeout=" + std::to_string(TIMEOUT)+"\r\n");
    }
    //output->append("Content-Length: "+std::to_string(body.size()) + "\r\n");
    for (const auto& header : headers)
    {
        output->append(header.first);
        output->append(": ");
        output->append(header.second);
        output->append("\r\n");
    }
    output->append("\r\n");
    if(body.size()>0)
        output->append(body);
}