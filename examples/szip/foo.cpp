#include <cstddef> // szlib.h uses size_t, but doesn't include stddef.h, workaround that
extern "C" {
// szlib.h is a C-library, but the header doesn't handle C++, so do it for the lib
// otherwise the functions (for example SZ_encoder_enabled()) will not be found
#include <szlib.h>
}
#include <iostream>

int main()
{
   std::cout << "SZLIB_VERSION: " << SZLIB_VERSION << std::endl;
   std::cout << "SZ_encoder_eabled: " << SZ_encoder_enabled() << std::endl;
   return 0;
}
