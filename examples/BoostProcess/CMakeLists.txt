# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(example-boost-process)

hunter_add_package(BoostProcess)
find_package(BoostProcess CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC BoostProcess::boost_process)
