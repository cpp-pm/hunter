#include <stdio.h>
#include <printf/printf.h>

void putchar_(char c) {
    putchar(c);
}

int main() {
    printf_("%s %d %f\n", "Hello World!", 42, 3.1415);
    return 0;
}

