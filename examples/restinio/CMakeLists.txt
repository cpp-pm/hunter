# Copyright (c) 2021 Niall Douglas
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-restinio)
find_package(Threads REQUIRED)

hunter_add_package(asio)
find_package(asio CONFIG REQUIRED)

hunter_add_package(http-parser)
find_package(http-parser CONFIG REQUIRED)

hunter_add_package(fmt)
find_package(fmt CONFIG REQUIRED)

hunter_add_package(restinio)
find_package(restinio CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC restinio::restinio)
