# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    dfdutils
    VERSION
    0.0.0-659a739-p0
    URL
    "https://github.com/cpp-pm/dfdutils/archive/refs/tags/v0.0.0-659a739-p0.tar.gz"
    SHA1
    31cd5cb5a3f58a45cf0e8d730509477ff0f23af1
)

hunter_add_version(
    PACKAGE_NAME
    dfdutils
    VERSION
    0.0.0-659a739-p1
    URL
    "https://github.com/cpp-pm/dfdutils/archive/refs/tags/v0.0.0-659a739-p1.tar.gz"
    SHA1
    66cc30d5ce8836ec6dbbc683dfdc67f2e8b3241b
)

hunter_cmake_args(
    dfdutils
    CMAKE_ARGS
        BUILD_FOR_LIBKTX=ON
        BUILD_TESTS=OFF
        BUILD_DOCS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(dfdutils)
hunter_download(PACKAGE_NAME dfdutils)
