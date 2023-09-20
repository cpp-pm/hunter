# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-abseil)

# DOCUMENTATION_START {
hunter_add_package(abseil)
find_package(absl CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC absl::strings)
# DOCUMENTATION_END }
