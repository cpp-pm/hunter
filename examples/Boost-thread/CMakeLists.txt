# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(Boost_DEBUG ON CACHE BOOLEAN "")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS system thread)

# This is important because Hunter build only boost as a static library by default!
set(Boost_USE_STATIC_LIBS ON)

find_package(Boost CONFIG REQUIRED system thread)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::thread)
