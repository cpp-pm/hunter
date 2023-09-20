# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-occt)

# DOCUMENTATION_START {
hunter_add_package(occt)
find_package(OpenCASCADE CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo occt::TKFillet  occt::TKOffset occt::TKBool  occt::TKBO occt::TKShHealing  occt::TKPrim occt::TKTopAlgo occt::TKBRep occt::TKGeomAlgo occt::TKGeomBase occt::TKG3d occt::TKG2d occt::TKMath occt::TKernel)
if(APPLE OR (UNIX AND NOT ANDROID))
  target_link_libraries(boo pthread)
elseif(WIN32)
  target_link_libraries(boo ws2_32)
endif()
# DOCUMENTATION_END }
