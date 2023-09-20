# Copyright (c) 2020, Rahul Sheth
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-tinyobjloader)

# DOCUMENTATION_START {
hunter_add_package(tinyobjloader)
find_package(tinyobjloader CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC tinyobjloader::tinyobjloader)
# DOCUMENTATION_END }
