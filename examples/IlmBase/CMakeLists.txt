# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-IlmBase)

# DOCUMENTATION_START {
hunter_add_package(IlmBase)
find_package(IlmBase CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC IlmBase::Half IlmBase::Imath)
# DOCUMENTATION_END }
