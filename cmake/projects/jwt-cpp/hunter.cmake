# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    jwt-cpp
    VERSION
    0.5.2
    URL
    "https://github.com/Thalhammer/jwt-cpp/archive/refs/tags/v0.5.2.tar.gz"
    SHA1
    528c0c23ec9d9e5af06770e4a0bc931a94a30a51
)

hunter_cmake_args(
    jwt-cpp
    CMAKE_ARGS
        JWT_BUILD_EXAMPLES=OFF
        JWT_BUILD_TESTS=OFF
        JWT_ENABLE_COVERAGE=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(jwt-cpp)
hunter_download(PACKAGE_NAME jwt-cpp)
