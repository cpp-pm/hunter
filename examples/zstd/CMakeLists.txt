# Copyright (c) 2019 Niall Douglas
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-zstd)
find_package(Threads REQUIRED)

hunter_add_package(zstd)
find_package(zstd CONFIG REQUIRED)

add_executable(foo-static foo.c)
target_link_libraries(foo-static PUBLIC zstd::libzstd_static Threads::Threads)

add_executable(foo-shared foo.c)
target_link_libraries(foo-shared PUBLIC zstd::libzstd_shared)
