# Copyright (c) 2025, Dominik Nussbaumer
# All rights reserved.

cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(Boost_DEBUG ON CACHE BOOLEAN "")
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/../Boost-useBoostConfig/config.cmake)

set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/toolchain.cmake"
    CACHE FILEPATH "Path to CMake toolchain file")
# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost)
find_package(Boost CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::boost)

find_package(Threads REQUIRED)
find_package(OpenSSL REQUIRED)
target_link_libraries(foo
  PUBLIC
    Threads::Threads
    OpenSSL::Crypto
    OpenSSL::SSL
)
