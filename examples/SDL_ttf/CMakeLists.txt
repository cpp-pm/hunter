# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-SDL_ttf)

hunter_add_package(SDL_ttf)
find_package(SDL_ttf CONFIG REQUIRED)

if(ANDROID)
  add_library(main SHARED main.cpp)
else()
  add_executable(main main.cpp)
endif()

# Fix MinGW / MSYS build
if(MINGW OR MSYS)
target_link_libraries(main
    mingw32
)
endif()

target_link_libraries(main
    SDL_ttf::SDL_ttf
    SDL2::SDL2main
    SDL2::SDL2)
