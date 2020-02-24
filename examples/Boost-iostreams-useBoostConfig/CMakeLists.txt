# Copyright (c) 2015, Aaditya Kalsi
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(Boost_DEBUG ON CACHE BOOLEAN "")
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(boost_iostreams)

hunter_add_package(Boost COMPONENTS iostreams serialization)
# If you use boost/iostreams/filter/gzip.hpp then you should add ZLIB
find_package(ZLIB CONFIG REQUIRED)
# If you use boost/iostreams/filter/bzip2.hpp then you should add BZip2
find_package(BZip2 CONFIG REQUIRED)
find_package(Boost CONFIG REQUIRED iostreams serialization)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::iostreams Boost::serialization ZLIB::zlib BZip2::bz2)
