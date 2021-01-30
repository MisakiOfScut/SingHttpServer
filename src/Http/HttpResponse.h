#ifndef __HTTPRESPONSE_H__
#define __HTTPRESPONSE_H__
#include <map>
#include <string>

namespace sing
{
using std::string;

class Buffer;
class HttpResponse
{
public:
    static const int TIMEOUT = 500;
    enum HttpStatusCode
    {
        Unknown,
        Code200_Ok = 200,
        Code301_MovePermanently = 301,
        Code400_BadRequest = 400,
        Code403_Forbidden = 403,
        Code404_NotFound = 404
    };

    HttpResponse(bool close) :closeConn(close),code(Unknown){}
    
    ~HttpResponse(){}

    void setStatusCode(HttpStatusCode code){this->code = code;}

    void setStatusMessage(string msg){statusMessage = msg;}

    void setCloseConnection(bool close){closeConn = close;}

    bool closeConnection(){return closeConn;}

    void setContectType(const string& ct){addHeader("Content-Type", ct);}

    void addHeader(const string& key, const string& value){headers[key]=value;}

    void setBody(const string& bd){body = bd;}

    void appendToBuffer(Buffer* output) const;
    
private:
    bool closeConn;//if true, then set keep alive
    std::map<string,string> headers;
    HttpStatusCode code;
    string statusMessage;
    string body;
};

}

#endif // !__HTTPRESPONSE_H__