# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-astc-encoder)

# DOCUMENTATION_START {
hunter_add_package(astc-encoder)

# find_package(astc-encoder CONFIG REQUIRED) # for v1.0-2.0
find_package(astcencoder CONFIG REQUIRED) # for v3.0+

add_executable(boo boo.cpp)
# target_link_libraries(boo PUBLIC astc-encoder::astcenc) # for v1.0-v2.0
target_link_libraries(boo PUBLIC astcencoder::astcenc-static) # for v3.0+
# DOCUMENTATION_END }
