#include <OpenEXR/ImfHeader.h>

#include <iostream>

int main() {
    Imf::Header header;
    std::cout << header.compression() << std::endl;
}
