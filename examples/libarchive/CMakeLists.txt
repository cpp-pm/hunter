# Copyright (c) 2020, Timothy Stack
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(test-libarchive)

# DOCUMENTATION_START {
hunter_add_package(libarchive)
find_package(libarchive CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC PkgConfig::libarchive)
# DOCUMENTATION_END }
