# Copyright (c) 2021 Niall Douglas
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-gsl-lite)

hunter_add_package(gsl-lite)
find_package(gsl-lite CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC gsl::gsl-lite)
