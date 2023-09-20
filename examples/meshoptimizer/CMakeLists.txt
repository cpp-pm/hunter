# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-meshoptimizer)

# DOCUMENTATION_START {
hunter_add_package(meshoptimizer)
find_package(meshoptimizer CONFIG REQUIRED)

# Available:
#  Libraries:
#   meshoptimizer::meshoptimizer
#   meshoptimizer::libgltfpack (if MESHOPT_BUILD_GLTFPACK=ON)
#  Binaries:
#   meshoptimizer::gltfpack (if MESHOPT_BUILD_GLTFPACK=ON)
#   meshoptimizer::demo (if MESHOPT_BUILD_DEMO=ON)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC meshoptimizer::meshoptimizer)
# DOCUMENTATION_END }
