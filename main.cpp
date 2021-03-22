#include "src/Http/HttpServer.h"
using namespace sing;

int main(int, char**) {
    HttpServer server(8000, 4, 2000);
    server.start();

    return 0;
}
