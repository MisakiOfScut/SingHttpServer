#include "HttpContext.h"
#include <unistd.h>
#include <iostream>
#include <bits/types/struct_iovec.h>
using namespace sing;

HttpContext::HttpContext(int fd)
    :state(REQUEST_LINE),fd(fd),working(false){
    assert(fd>=0);
}

HttpContext::~HttpContext(){
    close(fd);// FIX ME
}

bool HttpContext::parseRequest(){
    bool ok = true;
    bool hasMore = true;
    while (hasMore)
    {
        if (state == REQUEST_LINE)
        {
            const char* crlf = input.findCRLF();
            if(crlf){
                ok = parseRequestLine(input.peek(),crlf);
                if(ok){
                    input.retrieveUntil(crlf + 2);
                    state = HEADERS;
                }else{
                    hasMore = false;
                }
            }else{
                hasMore = false;
            }

        }else if (state == HEADERS)
        {
            const char* crlf = input.findCRLF();
            if(crlf){
                const char* colon = std::find(input.peek(),crlf,':');
                if(colon!=crlf){
                    request.addHeader(input.peek(),colon,crlf);
                }else{
                    state = BODY;
                    hasMore = true;
                }
                input.retrieveUntil(crlf + 2);

            }else{
                hasMore = false;
            }

        }else if (state==BODY)
        {
            //TO ADD: process requestbody
            state = FINSH;
            hasMore = false;
        }
    }

    return ok;
}

bool HttpContext::parseRequestLine(const char* begin, const char* end){
    bool success = false;
    const char* start = begin;
    const char* space = std::find(start, end, ' ');//find the 1st space in a line

    if(space!=end && request.setMethod(start,space)){
        start = space + 1;
        space = std::find(start, end, ' ');
        if(space!=end){
            const char* quest = std::find(start, space, '?');
            if (quest!=space)
            {
                request.setPath(start,quest);
                request.setQuery(quest, space);

            }else{
                request.setPath(start, space);
            }
            //parse http version
            start = space + 1;
            success = end-start == 8 && std::equal(start, end-1, "HTTP/1.");
            if(success){
                if(*(end-1)=='1'){
                    request.setVersion(HttpRequest::HTTP11);
                }else if(*(end-1)=='0'){
                    request.setVersion(HttpRequest::HTTP10);
                }else{
                    success = false;
                }
            }
        }
    }
    return success;
}

bool HttpContext::parseFinsh(){
    return state == FINSH;
}

void HttpContext::reset(){
    state = REQUEST_LINE;
    input.retrieveAll();
    output.retrieveAll();
    output.setWriteFile(NULL, 0);
    request.reset();
    response.reset();
}

int HttpContext::writev(int* savedErrno){
    return output.writeFd(fd, savedErrno);
}