#include <OpenEXR/half.h>
#include <OpenEXR/ImathVec.h>

#include <iostream>

int main() {
    half a = 0.123f;
    Imath::Vec2<int> b = Imath::Vec2<int>(1, 2);

    std::cout << a << " " << b << std::endl;
}
