#ifndef __HTTPRESPONSE_H__
#define __HTTPRESPONSE_H__
#include <map>
#include <string>
#include <sys/stat.h>
#include <sys/mman.h>

namespace sing
{
using std::string;

class Buffer;
class HttpResponse
{
public:
    static const int TIMEOUT = 500;
    static const std::map<int, std::string> statusCode2Message;
    static const std::map<std::string, std::string> suffix2Type;
    enum HttpStatusCode
    {
        Unknown,
        Code200_Ok = 200,
        Code301_MovePermanently = 301,
        Code400_BadRequest = 400,
        Code403_Forbidden = 403,
        Code404_NotFound = 404
    };

    HttpResponse() :closeConn(false),code(Unknown),mmFile(nullptr),mmFileStat({0}){}
    
    ~HttpResponse();

    void setStatusCode(HttpStatusCode code){this->code = code;}

    void setStatusMessage(string msg){statusMessage = msg;}

    void setCloseConnection(bool close){closeConn = close;}

    bool closeConnection(){return closeConn;}

    void setContectType(const string& ct){addHeader("Content-Type", ct);}

    void addHeader(const string& key, const string& value){headers[key]=value;}

    void setBody(const string& bd){body = bd;}

    void appendToBuffer(Buffer* output) const;

    void makeResponse(HttpStatusCode code, bool close);

    //provide file_ptr to write file to fd without appending buffer
    char* getFile();
    size_t getFileSize() const;

    void setFilePath(const string& srcDir, const string& path){ this->srcDir = srcDir; this->path = path;}

private:
    string getFileType();

    void unmapFile();

    void makeErrorResponse(const std::string& msg);
    
private:
    bool closeConn;//if true, then set keep alive
    std::map<string,string> headers;
    HttpStatusCode code;
    string statusMessage;
    string body;
    
    string srcDir;
    string path;
    char* mmFile;
    struct stat mmFileStat;
};

}

#endif // !__HTTPRESPONSE_H__