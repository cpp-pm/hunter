# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-hypre)

# DOCUMENTATION_START {
hunter_add_package(hypre)
find_package(HYPRE CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC HYPRE::HYPRE)
# DOCUMENTATION_END }
