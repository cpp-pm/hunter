#include <iostream>
#include <cppfs/fs.h>
#include <cppfs/FileHandle.h>

using namespace cppfs;

int main() {
    FileHandle fh = fs::open("testfile");

    if (fh.isFile())
    {
        auto in = fh.createInputStream();
        // ...

        auto out = fh.createOutputStream();
        // ...
    }
}
