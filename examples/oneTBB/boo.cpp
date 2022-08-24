#include <tbb/tbb.h>

int main() {
  // Calculate sum of numbers 1 to 100
  int sum = oneapi::tbb::parallel_reduce(oneapi::tbb::blocked_range<int>(1,101), 0,
    [](oneapi::tbb::blocked_range<int> const& r, int init) -> int {
       for (int v = r.begin(); v != r.end(); v++  ) {
          init += v;
       }
       return init;
    },
    [](int lhs, int rhs) -> int {
       return lhs + rhs;
    }
  );
}
