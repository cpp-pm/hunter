# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-stanhull)

hunter_add_package(stanhull)
find_package(stanhull CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC stanhull::stanhull)
