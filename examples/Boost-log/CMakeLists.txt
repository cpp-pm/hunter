# Copyright (c) 2013-2017, Ruslan Baratov
# Copyright (c) 2025, NeroBurner
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

set(Boost_DEBUG ON CACHE BOOLEAN "")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS log)
find_package(Boost CONFIG REQUIRED log)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::log)
