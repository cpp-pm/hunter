#include <gsl/gsl-lite.hpp>

int main(int argc, char *argv[])
{
  return gsl::span<int>(&argc, 1).front(), 0;
}
