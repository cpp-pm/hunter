# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-zlog)

# DOCUMENTATION_START {
hunter_add_package(zlog)
find_package(zlog CONFIG REQUIRED)

add_executable(boo boo.c)
target_link_libraries(boo PUBLIC zlog::zlog)
# DOCUMENTATION_END }
