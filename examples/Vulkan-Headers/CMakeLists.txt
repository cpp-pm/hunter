# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Vulkan-Headers)

# DOCUMENTATION_START {
hunter_add_package(Vulkan-Headers)
find_package(VulkanHeaders CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC Vulkan::Headers)
# DOCUMENTATION_END }
