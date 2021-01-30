#ifndef __HTTPREQUEST_H__
#define __HTTPREQUEST_H__
#include <string>
#include <chrono>
#include <map>

namespace sing
{
using std::string;
using Clock = std::chrono::high_resolution_clock;
using TimeStamp = Clock::time_point;

class HttpRequest
{
public:
    enum Method
    {
        Invalid, Get, Post, Head, Put, Delete
    };
    enum Version
    {
        Unknown, HTTP10, HTTP11
    };

    bool setMethod(const char* begin, const char* end){
        string m(begin,end);
        if(m=="GET"){
            method = Get;
        }else if(m=="POST"){
            method = Post;
        }else if(m=="HEAD"){
            method = Head;
        }else if(m=="PUT"){
            method = Put;
        }else if(m=="DELETE"){
            method = Delete;
        }else{
            method = Invalid;
        }
        return method != Invalid;
    }
    Method getMethod() const{
        return method;
    }
    const char* getMethodStr() const{
        const char* res = "UNKNOWN";
        if(method == Get)
            res = "GET";
        else if(method == Post)
            res = "POST";
        else if(method == Head)
            res = "HEAD";
        else if(method == Put)
            res = "Put";
        else if(method == Delete)
            res = "DELETE";
        return res;
    }

    //0 unkonwn; 1 http1.0; 2 http1.1
    void setVersion(Version v){version = v;}
    Version getVersion() const{return version;}

    void setPath(const char* begin, const char* end){path.assign(begin,end);}
    const string& getPath() const{return path;}

    void setQuery(const char* begin, const char* end){query.assign(begin,end);}
    const string& getQuery() const{return query;}

    void setReceiveTime(TimeStamp t){ receiveTime = t; }
    TimeStamp getReceiveTime() const{ return receiveTime; }

    void addHeader(const char* begin, const char* colon, const char* end){
        //e.x. HOST: www
        string field(begin, colon);//HOST
        ++colon;//move a char from `:`
        while (colon<end && isspace(*colon))//move util colon isn't space
            ++colon;
        string value(colon,end);//www
        while (!value.empty() && isspace(value[value.size()-1])){//delete the space after www
            value.resize(value.size()-1);
        }
        headers[field] = value;
    }
    string getHeaders(const string& field) const{
        string result;
        auto it = headers.find(field);
        if(it!=headers.end()){
            result = it->second;
        }
        return result;
    }

    bool keepAlive() const{
        std::string connection = getHeaders("Connection");
        bool res = connection == "Keep-Alive" || 
                (version == HTTP11 && connection != "close");

        return res;
    }

    void reset(){
        method = Invalid;
        version = Unknown;
        path = "";
        query = "";
        headers.clear();
    }

    HttpRequest():method(Invalid),version(Unknown){};
    ~HttpRequest(){}
    
private:
    Method method;
    Version version;
    string path;
    string query;
    TimeStamp receiveTime;
    std::map<string, string> headers;
};

}

#endif // !__HTTPREQUEST_H__