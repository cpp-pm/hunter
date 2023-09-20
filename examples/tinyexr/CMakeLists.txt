# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-tinyexr)

# DOCUMENTATION_START {
hunter_add_package(tinyexr)
find_package(tinyexr CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC tinyexr::tinyexr)
# DOCUMENTATION_END }
