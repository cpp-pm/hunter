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
    etc2comp
    VERSION
    0.0.0-9cd0f9c-p0
    URL
    "https://github.com/cpp-pm/etc2comp/archive/v0.0.0-9cd0f9c-p0.tar.gz"
    SHA1
    7ca3956f45a6a07ac8e0a204b293e84f8413d0d8
)

hunter_cmake_args(
    etc2comp
    CMAKE_ARGS
        BUILD_TOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(etc2comp)
hunter_download(PACKAGE_NAME etc2comp)
