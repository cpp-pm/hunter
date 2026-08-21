#include <duals/dual> // duals::dual
#include <iostream> // std::cout

int main() {
  using namespace duals::literals;
  auto y = (2.0 + 1.0_e) * sin(2.0 + 1.0_e);
  std::cout << "f(2) = " << rpart(y) << ", f'(2) = " << dpart(y) << std::endl;
}
