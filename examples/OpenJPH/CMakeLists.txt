# Copyright (c) 2025, NeroBurner
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-OpenJPH)

# DOCUMENTATION_START {
hunter_add_package(OpenJPH)
find_package(OpenJPH CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC openjph)
# DOCUMENTATION_END }
