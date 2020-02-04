# Copyright (c) 2013-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(Boost_DEBUG ON CACHE BOOLEAN "")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)
include(CMakePrintHelpers)

hunter_add_package(Boost COMPONENTS log)

# This is important because Hunter build only boost as a static library by default!
set(Boost_USE_STATIC_LIBS ON)

find_package(Boost CONFIG REQUIRED log)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::log)

cmake_print_variables(Boost_VERSION_STRING)
cmake_print_properties(
        TARGETS Boost::log
        PROPERTIES INTERFACE_LINK_LIBRARIES
)