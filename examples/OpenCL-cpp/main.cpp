#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_TARGET_OPENCL_VERSION 120

#if __APPLE__
#include <OpenCL/cl.h>
#else
#include <CL/cl.h>
#endif

#include <CL/opencl.hpp>

int main()
{
    std::vector<cl::Platform> platforms;

    cl::Platform::get(&platforms);
    return 0;
}



