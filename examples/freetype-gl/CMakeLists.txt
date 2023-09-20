cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-freetype-gl)

# DOCUMENTATION_START {
hunter_add_package(freetype-gl)
find_package(freetype-gl CONFIG REQUIRED)

add_executable(freetype-gl-example main.cpp)
target_link_libraries(freetype-gl-example PRIVATE freetype-gl::freetype-gl)
# DOCUMENTATION_END }
