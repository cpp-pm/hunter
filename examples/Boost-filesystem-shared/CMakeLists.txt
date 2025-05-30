# Copyright (c) 2013-2015, Ruslan Baratov
# Copyright (c) 2025, NeroBurner
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake) #set BUILD_SHARED_LIBS=ON
include("../common.cmake")

project(download-boost)

# download boost
hunter_add_package(Boost COMPONENTS filesystem)

add_executable(foo foo.cpp)
target_link_libraries(foo Boost::filesystem)
