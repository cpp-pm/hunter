#include <sw/redis++/redis++.h>
#include <sw/redis++/async_redis++.h>

using namespace sw::redis;

int main(int argc, char** argv) {
    {
        auto r = Redis("tcp://127.0.0.1");
        auto v = r.command<std::unordered_map<std::string, std::string>>("config", "get", "*");
    }
    {
        ConnectionOptions opts;
        opts.host = "127.0.0.1";
        opts.port = 6379;
        ConnectionPoolOptions pool_opts;
        pool_opts.size = 3;
        auto async_redis = AsyncRedis(opts, pool_opts);
    }
    return 0;
}