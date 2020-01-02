#include <boost/python.hpp>
#include <boost/python/numpy.hpp>

char const* greet()
{
   return "hello, world";
}

boost::python::numpy::ndarray arr()
{
    using namespace boost::python;
    return numpy::zeros(
        make_tuple(2, 2),
        numpy::dtype::get_builtin<float_t>());
}

BOOST_PYTHON_MODULE(hello_ext)
{
    using namespace boost::python;
    def("greet", greet);
    def("arr", arr);
}
