# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-xxHash)

# DOCUMENTATION_START {
hunter_add_package(xxHash)
find_package(xxHash CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC xxHash::xxhash)
# DOCUMENTATION_END }
