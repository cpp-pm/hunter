cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(libsimdpp-test)

# DOCUMENTATION_START {
hunter_add_package(libsimdpp)
find_package(libsimdpp CONFIG REQUIRED)

add_executable(libsimdpp_test main.cpp)
target_link_libraries(libsimdpp_test libsimdpp::simdpp)
# DOCUMENTATION_END }
