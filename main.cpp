#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <syslog.h>
#include "src/Http/HttpServer.h"
using namespace sing;

HttpServer* server = nullptr;

static void sig_int_handler(int signum){
    if(signum==SIGINT){
        syslog(LOG_NOTICE, "get signal interrupt");
        if(server!=nullptr) delete server;
        exit(EXIT_SUCCESS);
    } 
}

static void skeleton_daemon()
{
    pid_t pid;

    /* Fork off the parent process */
    pid = fork();

    /* An error occurred */
    if (pid < 0)
        exit(EXIT_FAILURE);

    /* Success: Let the parent terminate */
    if (pid > 0)
        exit(EXIT_SUCCESS);

    /* On success: The child process becomes session leader */
    if (setsid() < 0)
        exit(EXIT_FAILURE);

    /* Catch, ignore and handle signals */
    //TODO: Implement a working signal handler */
    signal(SIGCHLD, SIG_IGN);
    struct sigaction act;
    act.sa_handler = sig_int_handler;
    sigemptyset(&act.sa_mask);
    act.sa_flags = SA_INTERRUPT;
    if(sigaction(SIGINT, &act, NULL) < 0) exit(EXIT_FAILURE);

    /* Fork off for the second time*/
    pid = fork();

     /* An error occurred */
    if (pid < 0)
        exit(EXIT_FAILURE);

    /* Success: Let the parent terminate */
    if (pid > 0)
        exit(EXIT_SUCCESS);

    /* Set new file permissions */
    umask(0);

    /* !!!!!!!!!-----------------------Change the working directory to the root directory----------------------------!!!!!!!!!! */
    /* or another appropriated directory */
    chdir("~/workspace/SingHttpServer/build");

    /* Close all open file descriptors */
    int x;
    for (x = sysconf(_SC_OPEN_MAX); x>=0; x--)
    {
        close (x);
    }

    /* Open the log file */
    openlog ("SingHttpServer", LOG_PID, LOG_DAEMON);
}

int main(int, char**) {
    skeleton_daemon();
    server = new HttpServer(8000, 2, 2000);
    syslog(LOG_NOTICE, "Sing Server start");
    server->start();

    return 0;
}
