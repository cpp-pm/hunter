# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-shaderc)

# DOCUMENTATION_START {
hunter_add_package(shaderc)
find_package(shaderc CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC shaderc::shaderc)
# DOCUMENTATION_END }
