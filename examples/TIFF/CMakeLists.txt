# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2025, NeroBurner
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-tiff)

# download TIFF
hunter_add_package(TIFF)

# now TIFF can be used
find_package(TIFF CONFIG REQUIRED)

add_executable(foo main.c)
target_link_libraries(foo PRIVATE TIFF::libtiff)

# Compatibility mode
# try to find another time to check if package is well behaved
find_package(TIFF CONFIG REQUIRED)
