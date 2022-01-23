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
    v0.6.0-rc.1
    URL
    "https://github.com/Thalhammer/jwt-cpp/archive/refs/tags/v0.6.0-rc.1.tar.gz"
    SHA1
    6e0a3fa4581f538351fe50b635344b6dc18ed281
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
