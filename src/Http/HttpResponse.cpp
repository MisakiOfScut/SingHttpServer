#include "HttpResponse.h"
#include "../Buffer/Buffer.h"
#include <unistd.h>
#include <fcntl.h>
using namespace sing;

const std::map<int, std::string> HttpResponse::statusCode2Message = {
    {200, "OK"},
    {301,"Move Permanently"},
    {400, "Bad Request"},
    {403, "Forbidden"},
    {404, "Not Found"}
};

const std::map<std::string, std::string> HttpResponse::suffix2Type = {
    {".html", "text/html"},
    {".xml", "text/xml"},
    {".xhtml", "application/xhtml+xml"},
    {".txt", "text/plain"},
    {".rtf", "application/rtf"},
    {".pdf", "application/pdf"},
    {".word", "application/nsword"},
    {".png", "image/png"},
    {".gif", "image/gif"},
    {".jpg", "image/jpeg"},
    {".jpeg", "image/jpeg"},
    {".au", "audio/basic"},
    {".mpeg", "video/mpeg"},
    {".mpg", "video/mpeg"},
    {".avi", "video/x-msvideo"},
    {".gz", "application/x-gzip"},
    {".tar", "application/x-tar"},
    {".css", "text/css"},
    {".md", "text/plain"},
    {".mp4", "video/mpeg4"},
    {".mp3","audio/mp3"}
};

/*
    在获取报文体后再append到buffer，
    通过addHeader设置Content-length和Content-type
    如果body是文件则另外append，不要通过body设置避免一次copy
*/
void HttpResponse::appendToBuffer(Buffer* const output) const{
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

void HttpResponse::makeResponse(HttpStatusCode code, bool close){
    //set keep alive
    closeConn = close;

    //set code
    setStatusCode(code);
    auto it = statusCode2Message.find(code);
    if(it==statusCode2Message.end()){
        setStatusCode(Code400_BadRequest);
    }

    //----------------do err response-----------------------//
    if(this->code!=Code200_Ok){
        makeErrorResponse(statusMessage);
        return;
    }

    //----------------do static request---------------------//
    if(!path.empty()){
        //path = path=="/"?"/index.html":path;
        if(path=="/"){
            body = "Sing Welcome!";
            addHeader("Content-length", std::to_string(body.size()));
            addHeader("Content-type", "text/html");
        }
        /* 判断请求的资源文件 */
        else if(stat((srcDir + path).data(), &mmFileStat) < 0 || S_ISDIR(mmFileStat.st_mode)) {
            setStatusCode(Code404_NotFound);
            makeErrorResponse("File Not Found");
        }
        else if(!(mmFileStat.st_mode & S_IROTH)) {
            setStatusCode(Code403_Forbidden);
            makeErrorResponse("Access Denied");
        }
        else { 
            int srcFd = open((srcDir + path).data(), O_RDONLY);
            if(srcFd < 0) {
                setStatusCode(Code404_NotFound);
                makeErrorResponse("File Not Found1");
            }else{
                /* 将文件映射到内存提高文件的访问速度 MAP_PRIVATE 建立一个写入时拷贝的私有映射*/
                void* mmRet = mmap(0, (size_t)mmFileStat.st_size, PROT_READ, MAP_PRIVATE, srcFd, 0);
                if(mmRet == (void*)-1) {
                    setStatusCode(Code404_NotFound);
                    makeErrorResponse("File Not Found2");
                    return; 
                }
                mmFile = static_cast<char*>(mmRet);
                ::close(srcFd);

                addHeader("Content-length", std::to_string(mmFileStat.st_size));
                addHeader("Content-type", getFileType());
            }
        }
    }
}

void HttpResponse::makeErrorResponse(const std::string& msg){//FIX ME: send error page html file
    body += "<html><title>Server Error</title>";
    body += "<body bgcolor=\"ffffff\">";
    body += std::to_string(this->code) + " : " + statusCode2Message.at(code) + "\n";
    body += "<p>" + msg + "</p>";
    body += "<hr><em>sing web server</em></body></html>";
    addHeader("Content-length", std::to_string(body.size()));
    addHeader("Content-type", "text/html");
}

//判断文件类型
string HttpResponse::getFileType(){
    string::size_type idx = path.find_last_of('.');
    if(idx == string::npos) {
        return "text/plain";
    }
    string suffix = path.substr(idx);
    if(suffix2Type.count(suffix) == 1) {
        return suffix2Type.find(suffix)->second;
    }
    return "text/plain";
}

size_t HttpResponse::getFileSize()const{
    return mmFileStat.st_size;
}

char* HttpResponse::getFile(){
    return this->mmFile;
}

void HttpResponse::unmapFile(){
    if(mmFile){
        munmap(mmFile, mmFileStat.st_size);
        mmFile = nullptr;
    }
}

HttpResponse::~HttpResponse(){
    unmapFile();
}

void HttpResponse::reset(){
    unmapFile();
    mmFileStat = {0};
    headers.clear();
    code = Unknown;
    statusMessage.clear();
    body.clear();
    srcDir.clear();
    path.clear();
}