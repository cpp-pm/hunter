# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-jwt-cpp)

# DOCUMENTATION_START {
hunter_add_package(jwt-cpp)
find_package(jwt-cpp CONFIG REQUIRED)

add_executable(sample main.cpp)
target_link_libraries(sample PUBLIC jwt-cpp::jwt-cpp)
# DOCUMENTATION_END }
