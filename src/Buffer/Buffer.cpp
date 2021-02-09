#include "Buffer.h"
#include <errno.h>
#include <unistd.h>
using namespace sing;

//从fd读取数据写入buf
ssize_t Buffer::readFd(int fd, int *savedErrno){
    char extrabuff[65536];//在栈区开辟一个新buf确保一次可以读完所有数据
    struct iovec vec[2];
    const size_t writable = writableBytes();
    vec[0].iov_base = __begin() + writeIndex;
    vec[0].iov_len = writable;
    vec[1].iov_base = extrabuff;
    vec[1].iov_len = sizeof(extrabuff);
    // when there is enough space in this buffer, don't read into extrabuf.
    // when extrabuf is used, we read 128k-1 bytes at most.
    const int iovcnt = (writable < sizeof extrabuff) ? 2 : 1;
    const ssize_t n = readv(fd, vec, iovcnt);
    if(n<0){
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
// ssize_t Buffer::writeFd(int fd, int *savedErrno){
//     const size_t readble = readableBytes();
//     const ssize_t n = write(fd, peek(), readble);
//     if(n<=0){
//         if (n<0 && n==EINTR){
//             return 0;
//         }else{
//             *savedErrno = errno;
//             return -1;
//         }
//     }else {
//         readIndex += n;
//     }
//     return n;
// }

//write buffer and an extra char* to fd
ssize_t Buffer::writeFd(int fd, int* savedErrno){
    iov[0].iov_base = __begin() + readIndex;
    iov[0].iov_len = readableBytes();

    ssize_t n = -1;
    //do{
        n = writev(fd, iov, 2);
        if(n<=0){
            *savedErrno = errno;
            //break;
        }
        else if(static_cast<size_t>(n) > iov[0].iov_len){//write all buf but not extra all
            iov[1].iov_base = (uint8_t *)iov[1].iov_base + (n - iov[0].iov_len);
            iov[1].iov_len -= (n - iov[0].iov_len);
            if(iov[0].iov_len){
                retrieveAll();
                iov[0].iov_len = 0;
            }
        }
        else{//just write part of buff
            iov[0].iov_base = (uint8_t *)iov[0].iov_base + n;
            iov[0].iov_len -= n;
            retrieveUntil(n + peek());
        }
    //}while(iov[0].iov_len+iov[1].iov_len > 0);//循环写让writev触发-1，EAGAIN；然后设置EPOLLOUT!!!

    return n;
}