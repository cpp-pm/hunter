# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.12)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-libp2p)

hunter_add_package(libp2p)
find_package(libp2p CONFIG REQUIRED)

add_executable(libp2p_example main.cpp)
target_link_libraries(libp2p_example PRIVATE
        libp2p::p2p_peer_id
        libp2p::p2p_multiaddress
)

