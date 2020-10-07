#include <apg_console.h>
#include <apg_bmp.h>

int main() {
    unsigned char* img_mem = apg_bmp_read(NULL, NULL, NULL, NULL);
    apg_c_backspace();
}
