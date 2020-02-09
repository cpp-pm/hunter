# Copyright (c) 2013, Ruslan Baratov
# Modified work: Copyright (c) 2018, Gregory Kramida
# All rights reserved.

cmake_minimum_required(VERSION 3.12)
option(HUNTER_BUILD_SHARED_LIBS "..." ON)

set(Boost_DEBUG ON CACHE BOOLEAN "")

# Configure:
set(PYTHON_VERSION 3.5)
set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

# Requires python version 3.5. Change this in config.cmake if necessary.
hunter_add_package(Boost COMPONENTS python)
find_package(Boost CONFIG REQUIRED python35 numpy35)

# pip_numpy must come before we find Python as it enables the virtualenv
find_package(pip_numpy CONFIG REQUIRED)
find_package(Python ${PYTHON_VERSION} REQUIRED COMPONENTS Interpreter Development NumPy)

Python_add_library(foo MODULE foo.cpp)
target_link_libraries(
    foo
    PUBLIC
    Boost::python35
    Boost::numpy35
)
