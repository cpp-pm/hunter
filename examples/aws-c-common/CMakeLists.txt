# Copyright (c) 2016-2020, Ruslan Baratov, Rahul Sheth
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-aws-c-common)

# DOCUMENTATION_START {
hunter_add_package(aws-c-common)

find_package(aws-c-common CONFIG REQUIRED)

# To use exported modules
get_filename_component(AWS_CMAKE_MODULE_PATH "${aws-c-common_DIR}/../../cmake" ABSOLUTE)
list(APPEND CMAKE_MODULE_PATH "${AWS_CMAKE_MODULE_PATH}")
include(AwsSIMD)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC AWS::aws-c-common)
# DOCUMENTATION_END }
