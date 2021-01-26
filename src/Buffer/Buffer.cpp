#include "Buffer.h"
#include <bits/types/struct_iovec.h>
#include <errno.h>
#include <unistd.h>
using namespace sing;

//从fd读取数据写入buf
ssize_t Buffer::readFd(int fd, int *savedErrno){
    char extrabuff[65536];//在栈区开辟一个新buf确保一次可以读完所有数据
    struct iovec vec[2];
    const size_t writable = writableBytes();
    vec[0].iov_base = __begin() + readIndex;
    vec[0].iov_len = writable;
    vec[1].iov_base = extrabuff;
    vec[1].iov_len = sizeof(extrabuff);
    const ssize_t n = read( fd, vec, writable);
    if(n<=0){
        *savedErrno = errno;
    }else if (static_cast<size_t>(n)<=writable){
        writeIndex += n;
    }else {//如果n>writable说明部分数据写到了extrabuf里
        writeIndex = buffer.size();
        append(extrabuff, n-writable);
    }
    return n;
}

//将buf的数据写入fd
ssize_t Buffer::writeFd(int fd, int *savedErrno){
    const size_t readble = readableBytes();
    const ssize_t n = write(fd, peek(), readble);
    if(n<=0){
        if (n<0 && n==EINTR){
            return 0;
        }else{
            *savedErrno = errno;
            return -1;
        }
    }else {
        readIndex += n;
    }
    return n;
}
