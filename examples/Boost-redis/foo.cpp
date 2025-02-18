#include <boost/asio/co_spawn.hpp>
#include <boost/asio/consign.hpp>
#include <boost/asio/deferred.hpp>
#include <boost/asio/detached.hpp>
#include <boost/redis/connection.hpp>
#include <iostream>

#include <boost/redis/src.hpp>

namespace asio = boost::asio;
using boost::redis::config;
using boost::redis::connection;
using boost::redis::logger;
using boost::redis::request;
using boost::redis::response;

auto co_main(config cfg) -> asio::awaitable<void> {
  auto conn = std::make_shared<connection>(co_await asio::this_coro::executor);
  conn->async_run(cfg, {logger::level::debug},
                  asio::consign(asio::detached, conn));

  // A request containing only a ping command.
  request req;
  req.push("PING", "Hello world");

  // Response where the PONG response will be stored.
  response<std::string> resp;

  // Executes the request.
  co_await conn->async_exec(req, resp, asio::deferred);
  conn->cancel();

  std::cout << "PING: " << std::get<0>(resp).value() << std::endl;
}

auto main(int argc, char *argv[]) -> int {
  try {
    config cfg;

    asio::io_context ioc;
    asio::co_spawn(ioc, co_main(cfg), [](std::exception_ptr p) {
      if (p)
        std::rethrow_exception(p);
    });
    ioc.run();

  } catch (std::exception const &e) {
    std::cerr << "(main) " << e.what() << std::endl;
    return 1;
  }
}
