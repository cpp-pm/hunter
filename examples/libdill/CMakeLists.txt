cmake_minimum_required(VERSION 3.10)

include("../common.cmake")

project(download-libevent)

hunter_add_package(libdill)

find_package(libdill CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main libdill::dill)
