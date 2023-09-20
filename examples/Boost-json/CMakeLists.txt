# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

set(Boost_DEBUG ON CACHE BOOLEAN "")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS json)
find_package(Boost CONFIG REQUIRED json)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::json)
