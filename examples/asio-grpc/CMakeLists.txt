# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-asio-grpc)

# DOCUMENTATION_START {
hunter_add_package(asio-grpc)
find_package(asio-grpc CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC asio-grpc::asio-grpc)
# DOCUMENTATION_END }

# Test double library creation
find_package(asio-grpc CONFIG REQUIRED)

# Check license
string(COMPARE EQUAL "${asio-grpc_LICENSES}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "Licenses not found")
endif()

message("asio-grpc licenses:")
foreach(x ${asio-grpc_LICENSES})
  message("* ${x}")
  if(NOT EXISTS "${x}")
    message(FATAL_ERROR "File not found")
  endif()
endforeach()
