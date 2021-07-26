#include <OpenEXR/ImfHeader.h>

#include <ImfRgbaFile.h>

#include <iostream>

int main() {
    Imf::Header header;
    std::cout << header.compression() << std::endl;
}
