# Copyright (c) 2022, Ronny Nowak
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-hiredis)

hunter_add_package(HiRedis)
find_package(HiRedis CONFIG REQUIRED)

add_executable(example main.cpp)
target_link_libraries(example PUBLIC hiredis::hiredis_static)