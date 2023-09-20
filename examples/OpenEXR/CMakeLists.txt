# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-OpenEXR)

# DOCUMENTATION_START {
hunter_add_package(OpenEXR)
find_package(OpenEXR CONFIG REQUIRED)

add_executable(boo boo.cpp)

# For OpenEXR < 3.0
#  - see https://github.com/AcademySoftwareFoundation/Imath/blob/master/docs/PortingGuide2-3.md
# target_link_libraries(boo PUBLIC OpenEXR::IlmImf)
target_link_libraries(boo PUBLIC OpenEXR::OpenEXR)
# DOCUMENTATION_END }
