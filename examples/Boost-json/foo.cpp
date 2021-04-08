
#include <iostream>
#include <boost/json.hpp>
using namespace boost::json;

int main() {
    object obj;
    obj[ "pi" ] = 3.141;
    obj[ "happy" ] = true;
    obj[ "name" ] = "Boost";
    obj[ "nothing" ] = nullptr;
    obj[ "answer" ].emplace_object()["everything"] = 42;
    obj[ "list" ] = { 1, 0, 2 };
    obj[ "object" ] = { {"currency", "USD"}, {"value", 42.99} };

    std::cout << obj << std::endl;
}
