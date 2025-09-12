#include <libdeflate.h>
#include <iostream>

int main() {
    std::cout << "libdeflate version: " << LIBDEFLATE_VERSION_STRING << std::endl;
    libdeflate_compressor *compressor = libdeflate_alloc_compressor(0);
    size_t compressed_bound = libdeflate_deflate_compress_bound(compressor, 1337);
    std::cout << "libdeflate_deflate_compress_bound(1337) => " << compressed_bound << std::endl;
    libdeflate_free_compressor(compressor);
}
