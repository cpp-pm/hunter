# Copyright (c) 2016, Alexandre Pretyman

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(glfw-example)

hunter_add_package(glfw)
find_package(glfw3 CONFIG REQUIRED)

set(${PROJECT_NAME}_SOURCES
  simple.c
)

add_executable(${PROJECT_NAME}
    ${${PROJECT_NAME}_SOURCES}
)

target_link_libraries(${PROJECT_NAME} glfw)
