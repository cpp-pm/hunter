# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-aws-sdk-cpp)

# DOCUMENTATION_START {
# You need to set which parts of the SDK you want to build (default is s3)
#
# hunter_config(aws-sdk-cpp
#   VERSION 1.9.94
#   CMAKE_ARGS
#     BUILD_ONLY=s3
# )
#

hunter_add_package(aws-sdk-cpp)
find_package(AWSSDK REQUIRED COMPONENTS s3)

if (NOT WIN32)
  find_package(CURL CONFIG REQUIRED)
endif()

add_executable(boo boo.cpp)
message("${AWSSDK_LINK_LIBRARIES}")
target_link_libraries(boo PUBLIC ${AWSSDK_LINK_LIBRARIES})
# DOCUMENTATION_END }
