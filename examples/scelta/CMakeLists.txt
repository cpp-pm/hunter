# Copyright (c)
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(scelta)

# DOCUMENTATION_START {
hunter_add_package(scelta)
find_package(scelta CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC scelta::headers)
# DOCUMENTATION_END }
