# Copyright (c)
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(lager)

# DOCUMENTATION_START {
hunter_add_package(lager)
find_package(lager CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC PkgConfig::lager)
# DOCUMENTATION_END }
