#ifndef __BUFFER_H__
#define __BUFFER_H__

#include <vector>
#include <string>
#include <algorithm>
#include <assert.h>
#include <string.h>
#include <sys/types.h>

namespace sing {

class Buffer{
public:
    static const size_t BUFFER_SIZE = 1024;
    
    Buffer()
    :readIndex(0),writeIndex(0),buffer(BUFFER_SIZE){
        assert(writableBytes()==BUFFER_SIZE);
        assert(readableBytes()==0);
    }

    ~Buffer(){}

    size_t readableBytes() const{
        return writeIndex-readIndex;
    }

    size_t writableBytes() const{
        return buffer.size() - writeIndex;
    }

    size_t prependableBytes() const{
        return readIndex;
    }

    // 返回第一个可读位置
    const char* peek() const{ 
        return __begin() + readIndex; 
    }

    // 恢复len个字节的可写空间
    void retrieve(size_t len){
        assert(len <= readableBytes());
        readIndex += len;
    }

    // 恢复从可读位置到某个位置之间的可写空间
    void retrieveUntil(const char* end){
        assert(peek() <= end);
        assert(end <= beginWrite());
        retrieve(end - peek());
    }

    // 取出buffer内全部数据后重置读写index
    void retrieveAll(){
        readIndex = 0;
        writeIndex = 0;
    }

    // 以string形式取出全部数据
    std::string retrieveAsString(){
        std::string str(peek(), readableBytes());
        retrieveAll();
        return str;
    }

    // 将字符串str中的数据写入buffer
    void append(const std::string& str){ 
        append(str.data(), str.length()); 
    }

    // 将数据写入buffer
    void append(const void* data, size_t len){ 
        append(static_cast<const char*>(data), len); 
    }

    // 将char*开始len长度的数据写入buffer
    void append(const char* data, size_t len){
        ensureWritableBytes(len);
        std::copy(data, data + len, beginWrite());
        hasWritten(len);
    }



    // 把其它缓冲区的数据添加到本缓冲区
    void append(const Buffer& otherBuff){ 
        append(otherBuff.peek(), otherBuff.readableBytes()); 
    }

    // 确保缓冲区有足够空间
    void ensureWritableBytes(size_t len){
        if(writableBytes() < len) {//如果空间不足则扩充可写空间
            makeSpace(len);
        }
        assert(writableBytes() >= len);
    }

    // 获取可写位置char指针
    char* beginWrite(){ 
        return __begin() + writeIndex; 
    }

    const char* beginWrite() const
    { return __begin() + writeIndex; }

    // 写入数据后移动writerIndex_
    void hasWritten(size_t len){ 
        writeIndex += len; 
    }

    const char* findCRLF() const{
        const char CRLF[] = "\r\n";
        const char* crlf = std::search(peek(), beginWrite(), CRLF, CRLF+2);
        return crlf == beginWrite() ? nullptr : crlf;
    }

    const char* findCRLF(const char* start) const{
        assert(peek() <= start);
        assert(start <= beginWrite());
        const char CRLF[] = "\r\n";
        const char* crlf = std::search(start, beginWrite(), CRLF, CRLF + 2);
        return crlf == beginWrite() ? nullptr : crlf;
    }

    const char* findLF() const{
        const void* eol = memchr(peek(), '\n', readableBytes());
        return static_cast<const char*>(eol);
    }

    const char* findLF(const char* start) const{
        assert(peek() <= start);
        assert(start <= beginWrite());
        const void* eol = memchr(start, '\n', beginWrite() - start);
        return static_cast<const char*>(eol);
    }

    ssize_t readFd(int fd, int* savedErrno); // 从套接字读到缓冲区
    ssize_t writeFd(int fd, int* savedErrno); // 缓冲区写到套接字

private:
    // 返回缓冲区头指针
    char* __begin(){ 
        return &*buffer.begin(); 
    }

    // 返回缓冲区头指针
    const char* __begin() const{ 
        return &*buffer.begin(); 
    }

    // 确保缓冲区有足够空间
    void makeSpace(size_t len){
        if(writableBytes() + prependableBytes() < len) {//如果通过移动已写数据依旧没有足够空间写下
            buffer.resize(writeIndex + len);//vector resize
        }
        else {//将已写数据移动到到缓冲区开头
            size_t readable = readableBytes();
            std::copy(__begin() + readIndex,
                      __begin() + writeIndex,
                      __begin());
            readIndex = 0;
            writeIndex = readIndex + readable;
            assert(readable == readableBytes());
        }
    }

private:
    size_t writeIndex;
    size_t readIndex;
    std::vector<char> buffer;
};

}

#endif
