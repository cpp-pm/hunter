# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-nng)

# DOCUMENTATION_START {
hunter_add_package(nng)
find_package(nng CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC nng::nng)
# DOCUMENTATION_END }
