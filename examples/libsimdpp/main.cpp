#include <simdpp/simd.h>
int main() {
    simdpp::uint8<32> a;
    simdpp::uint8<32> b;
    auto c = a + b;
}