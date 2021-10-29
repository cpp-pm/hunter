#include <tcmalloc/malloc_extension.h>
#include <iostream>

int main() {
  std::cout << tcmalloc::MallocExtension::GetStats() << std::endl;
}
