#include <zug/compose.hpp>
#include <zug/run.hpp>
#include <zug/transducer/map.hpp>
#include <zug/transducer/read.hpp>
#include <zug/transducer/write.hpp>

#include <sstream>
#include <vector>
#include <iostream>

using namespace zug;

int main() {
    auto input  = std::stringstream{"1 2 3 4 5"};
    auto output = std::stringstream{};

    run(comp(read<int>(input), write(output, ';')));
    std::cout << output.str();
    return 0;
}
