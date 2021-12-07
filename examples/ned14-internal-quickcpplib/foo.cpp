#include <quickcpplib/byte.hpp>
#include <quickcpplib/signal_guard.hpp>

int main() {
  using namespace QUICKCPPLIB_NAMESPACE::signal_guard;
  signal_guard_install i(signalc_set::segmentation_fault | signalc_set::cxx_termination);
  (void) i;
  return 0;
}
