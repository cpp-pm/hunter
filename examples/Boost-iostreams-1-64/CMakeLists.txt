cmake_minimum_required(VERSION 3.5)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(Boost-iostreams-1_64_0)

hunter_add_package(Boost COMPONENTS iostreams serialization)
find_package(Boost CONFIG REQUIRED iostreams serialization)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::iostreams Boost::serialization)
