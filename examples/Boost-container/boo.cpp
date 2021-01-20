#include <boost/container/vector.hpp>

using namespace boost::container;

struct animal
{
  vector<animal> children;
};

int main()
{
  animal parent, child1, child2;
  parent.children.push_back(child1);
  parent.children.push_back(child2);
}
