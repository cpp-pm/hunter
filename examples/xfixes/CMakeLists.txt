# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-xfixes)

# download xfixes
hunter_add_package(xfixes)
