# Copyright (c) 2025, Dominik Nussbaumer
# All rights reserved.

cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(Boost_DEBUG ON CACHE BOOLEAN "")
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/../Boost-useBoostConfig/config.cmake)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-boost)
hunter_add_package(Boost COMPONENTS charconv)
find_package(Boost CONFIG REQUIRED charconv)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::charconv)
