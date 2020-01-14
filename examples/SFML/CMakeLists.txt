cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-SFML)

# DOCUMENTATION_START {
hunter_add_package(SFML)
find_package(SFML COMPONENTS graphics CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC sfml-graphics)
# DOCUMENTATION_END }
