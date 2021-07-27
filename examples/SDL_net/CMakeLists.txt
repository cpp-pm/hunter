cmake_minimum_required (VERSION 3.0)

set(HUNTER_USE_CACHE_SERVERS NO)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(SDL_net-test)

hunter_add_package(SDL_net)
find_package(SDL_net CONFIG REQUIRED)

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
    SDL_net::SDL_net
    SDL2::SDL2main
    SDL2::SDL2)
