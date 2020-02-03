# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(Boost_DEBUG ON CACHE BOOLEAN "")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS system)

# This is important because Hunter build only boost as a static library by default!
set(Boost_USE_STATIC_LIBS ON)

if(MSVC)
  # See cmake/projects/Boost/schemes/url_sha1_boost_library.cmake.in line 205. If BOOST_BUILD_DYNAMIC_VSRUNTIME is true, boost is build with runtime-link=static
  # It is set when see cmake/projects/Boost/hunter.cmake line 415
  hunter_check_toolchain_definition(NAME "_DLL" DEFINED _hunter_vs_md)
  set(Boost_USE_STATIC_RUNTIME ${_hunter_vs_md})
endif()

find_package(Boost CONFIG REQUIRED system)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::system)

file(GLOB_RECURSE boost_configs "${BOOST_ROOT}/*/BoostConfig.cmake")
list(LENGTH boost_configs len)
if(NOT len GREATER "0")
  message(FATAL_ERROR "Not even one *Config: ${boost_configs}")
endif()
