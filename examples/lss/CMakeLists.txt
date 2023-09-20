# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-lss)

hunter_add_package(lss)
find_package(lss CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC lss::lss)
