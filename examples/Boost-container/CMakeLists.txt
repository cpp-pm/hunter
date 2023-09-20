cmake_minimum_required(VERSION 3.5)

set(Boost_DEBUG ON CACHE BOOLEAN "")

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-boost)

# DOCUMENTATION_START {
hunter_add_package(Boost COMPONENTS container)
find_package(Boost CONFIG REQUIRED container)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC Boost::container)
# DOCUMENTATION_END }
