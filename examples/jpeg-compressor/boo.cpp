#include <jpgd.h>

int main() {
    unsigned char* test = jpgd::decompress_jpeg_image_from_memory(NULL, 0, NULL, NULL, NULL, 0);
    if(test) return 0;
    return 1;
}
