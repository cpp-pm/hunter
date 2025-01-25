# Copyright (c) 2024 Eyal Rozenberg <eyalroz1@gmx.com>
# Copyright (c) 2024 Alexander Voronov <kab00m@ya.ru>
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

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
