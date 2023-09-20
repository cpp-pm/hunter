cmake_minimum_required(VERSION 3.5)

include("../common.cmake")

project(download-crc32c)

# DOCUMENTATION_START {
hunter_add_package(crc32c)
find_package(Crc32c CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main Crc32c::crc32c)
# DOCUMENTATION_END }
