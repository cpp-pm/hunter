# Copyright (c) 2015, Aaditya Kalsi
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(Boost_DEBUG ON CACHE BOOLEAN "")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(boost_iostreams)

hunter_add_package(Boost COMPONENTS iostreams)

# This is important because Hunter build only boost as a static library by default!
set(Boost_USE_STATIC_LIBS ON)

find_package(Boost CONFIG REQUIRED iostreams)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::iostreams)
