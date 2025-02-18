// https://www.boost.org/doc/libs/1_87_0/libs/cobalt/doc/html/index.html

#include <boost/asio/steady_timer.hpp>
#include <boost/cobalt.hpp>
#include <boost/cobalt/main.hpp>

using namespace boost;

cobalt::main co_main(int argc, char *argv[]) {
  auto exec = co_await cobalt::this_coro::executor;
  asio::steady_timer tim{exec, std::chrono::milliseconds(50)};
  co_await tim.async_wait(cobalt::use_op);
  co_return 0;
}
