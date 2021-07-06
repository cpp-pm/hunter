#include <KHR/dfd.h>

int main() {
    InterpretedDFDChannel R = {0,0}, G = {0,0}, B = {0,0}, A = {0,0};
    uint32_t wordSize;
    enum InterpretDFDResult t;

    uint32_t* d = createDFDUnpacked(0, 3, 1, 0, s_UNORM);
    printDFD(d);
    t = interpretDFD(d, &R, &G, &B, &A, &wordSize);
}
