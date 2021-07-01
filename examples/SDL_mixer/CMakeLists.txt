cmake_minimum_required (VERSION 3.0)

set(HUNTER_USE_CACHE_SERVERS NO)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(SDL_mixer-test)

hunter_add_package(SDL_mixer)
find_package(SDL_mixer CONFIG REQUIRED)

if(ANDROID)
  add_library(main SHARED main.cpp)
else()
  add_executable(main main.cpp)
endif()

# Fix MinGW / MSYS build
if(MINGW OR MSYS)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fstack-protector")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector")
target_link_libraries(main
    mingw32
)
endif()

target_link_libraries(main
    SDL_mixer::SDL_mixer
    SDL2::SDL2main
    SDL2::SDL2)
