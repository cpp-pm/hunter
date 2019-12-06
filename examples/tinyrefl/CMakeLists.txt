# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(tinyrefl)

# DOCUMENTATION_START {
hunter_add_package(tinyrefl)
find_package(tinyrefl CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC PkgConfig::tinyrefl)
# DOCUMENTATION_END }
