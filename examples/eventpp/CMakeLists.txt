# Copyright (c) 2022
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(eventpp-example)

# DOCUMENTATION_START {
hunter_add_package(eventpp)
find_package(eventpp CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main eventpp::eventpp)
include_directories(${EVENTPP_INCLUDE_DIR})
# DOCUMENTATION_END }