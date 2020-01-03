# Copyright (c)
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(Lager)

# DOCUMENTATION_START {
hunter_add_package(Lager)
find_package(Lager CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC lager)
# DOCUMENTATION_END }
