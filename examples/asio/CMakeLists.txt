# Copyright (c) 2019 Niall Douglas
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-asio)
find_package(Threads REQUIRED)

hunter_add_package(asio)
find_package(asio CONFIG REQUIRED)

add_executable(foo-headeronly foo.cpp)
target_link_libraries(foo-headeronly PUBLIC asio::asio_headeronly)

add_executable(foo-static foo.cpp)
target_link_libraries(foo-static PUBLIC asio::asio_static)

add_executable(foo-shared foo.cpp)
target_link_libraries(foo-shared PUBLIC asio::asio_shared)
