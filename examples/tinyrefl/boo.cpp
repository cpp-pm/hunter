#include <tinyrefl/api.hpp>

#include "example.hpp"
#include "example.hpp.tinyrefl" // This header is generated via tinyrefl_tool() in cmake.

int main() {
    static_assert(tinyrefl::has_metadata<example::A>(), "");
}
