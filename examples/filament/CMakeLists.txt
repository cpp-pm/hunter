# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)
include("../common.cmake")

project(download-filament)

# DOCUMENTATION_START {
hunter_add_package(filament)
find_package(Threads)
find_package(filament CONFIG REQUIRED)

add_executable(filament_test main.cpp)
target_link_libraries(filament_test PUBLIC filament::filament)
# DOCUMENTATION_END }
