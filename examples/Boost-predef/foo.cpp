// https://www.boost.org/doc/libs/1_83_0/libs/predef/doc/index.html#_using_the_predefs
#include <boost/predef.h>
#include <iostream>

int main()
{
  if (BOOST_COMP_GNUC >= BOOST_VERSION_NUMBER(4,0,0))
    std::cout << "GCC compiler is at least version 4.0.0" << std::endl;
  else
    std::cout << "GCC compiler is at older than version 4.0.0, or not a GCC compiler" << std::endl;
  return 0;
}
