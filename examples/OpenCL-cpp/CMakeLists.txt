cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_opencl_cpp)

hunter_add_package(OpenCL-cpp)
find_package(OpenCLHeadersCpp CONFIG REQUIRED)

hunter_add_package(OpenCL)
find_package(OpenCL CONFIG REQUIRED)

add_executable(opencl_cpp_test main.cpp)
target_link_libraries(opencl_cpp_test OpenCL::HeadersCpp OpenCL::OpenCL)
