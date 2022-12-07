#include <hiredis/hiredis.h>

int main(int argc, char** argv) {
    redisContext *c = nullptr;
    redisReply *reply = nullptr;
    redisOptions options = { 0 };
    REDIS_OPTIONS_SET_TCP(&options, "127.0.0.1", 6379);
    return 0;
}
