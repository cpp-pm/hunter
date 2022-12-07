# Copyright (c) 2022, Ronny Nowak
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-redis++)

# DOCUMENTATION_START {
hunter_add_package(HiRedis)
find_package(HiRedis CONFIG REQUIRED)

hunter_add_package(libuv)
find_package(libuv CONFIG REQUIRED)

hunter_add_package(Redis++)
find_package(Redis++ CONFIG REQUIRED)

add_executable(example main.cpp)
target_link_libraries(example PUBLIC redis++::redis++_static uv)
# DOCUMENTATION_END }

# Test double library creation
find_package(Redis++ CONFIG REQUIRED)
