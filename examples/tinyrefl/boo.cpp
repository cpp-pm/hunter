#include <tinyrefl/api.hpp>

#include "example.hpp"
#include "example.hpp.tinyrefl"

int main() {
    static_assert(tinyrefl::has_metadata<example::A>(), "");
}
