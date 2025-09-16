#include <openjph/ojph_version.h>
#include <openjph/ojph_arch.h>

#include <iostream>

int main() {
    std::cout << "OpenJPH version: "
        << OPENJPH_VERSION_MAJOR << "."
        << OPENJPH_VERSION_MINOR << "."
        << OPENJPH_VERSION_PATCH << std::endl;
    std::cout << "arch level: " << ojph::get_cpu_ext_level() << std::endl;
    return 0;
}
