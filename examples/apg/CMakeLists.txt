# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-apg)

# DOCUMENTATION_START {
hunter_add_package(apg)
find_package(apg CONFIG REQUIRED)

add_executable(boo boo.cpp)
#Available:
# apg::apg
# apg::unicode
# apg::bmp
# apg::wav
# apg::pixfont
# apg::maths
# apg::interp
# apg::tga
# apg::console

target_link_libraries(boo PUBLIC apg::console apg::bmp)
# DOCUMENTATION_END }
