# Copyright (c) 2021 Niall Douglas
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-ned14-internal-quickcpplib)
find_package(Threads REQUIRED)

hunter_add_package(ned14-internal-quickcpplib)
find_package(quickcpplib CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC quickcpplib::hl Threads::Threads)
