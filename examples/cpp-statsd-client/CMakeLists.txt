# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cpp-statsd-client)

# DOCUMENTATION_START {
hunter_add_package(cpp-statsd-client)
find_package(cpp-statsd-client CONFIG REQUIRED)

add_executable(boo boo.cpp)
#For mingw/msys
if(WIN32)
  target_compile_definitions(boo PRIVATE _WIN32_WINNT=0x601)
endif()
target_link_libraries(boo PUBLIC cpp-statsd-client::cpp-statsd-client)
# DOCUMENTATION_END }
