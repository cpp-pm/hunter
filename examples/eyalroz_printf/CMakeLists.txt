# Copyright (c) 2023, Alexander Voronov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-eyalroz_printf)

# DOCUMENTATION_START {
hunter_add_package(eyalroz_printf)
find_package(printf CONFIG REQUIRED)

add_executable(main main.c)
target_link_libraries(main PUBLIC printf::printf)
# DOCUMENTATION_END }

# Test double library creation
find_package(printf CONFIG REQUIRED)
