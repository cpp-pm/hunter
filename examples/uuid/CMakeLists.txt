# Copyright (c)
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(uuid)

# DOCUMENTATION_START {
hunter_add_package(uuid)
find_package(uuid CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC PkgConfig::uuid)
# DOCUMENTATION_END }
