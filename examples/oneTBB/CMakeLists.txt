# Copyright (c) 2022, Raffael Casagrande
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-oneTBB)

# DOCUMENTATION_START {
hunter_add_package(oneTBB)
find_package(TBB CONFIG REQUIRED)
find_package(Threads REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC TBB::tbb)
# DOCUMENTATION_END }
