#include <stdio.h>
#include <math.h>
#include <printf/printf.h>

void putchar_(char c) {
    putchar(c);
}

int main() {
    printf_("%s %d %f\n", "Hello World!", 42, M_PI);
    return 0;
}

