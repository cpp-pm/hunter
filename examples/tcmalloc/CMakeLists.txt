# Copyright (c) 2022, Raffael Casagrande
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-tcmalloc)

# DOCUMENTATION_START {
hunter_add_package(tcmalloc)
find_package(tcmalloc CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC tcmalloc::tcmalloc)
# DOCUMENTATION_END }
