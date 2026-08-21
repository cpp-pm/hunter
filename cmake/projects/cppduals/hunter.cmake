# Copyright (c) 2026, Michael Tesch
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cppduals
    VERSION
    0.9.1
    URL
    "https://gitlab.com/tesch1/cppduals/-/archive/v0.9.1/cppduals-v0.9.1.tar.gz"
    SHA1
    e9cab4fbcfab1da73ed95871bc11c30e32c5d9c4
)

hunter_cmake_args(
    cppduals
    CMAKE_ARGS
        CPPDUALS_TESTING=OFF
        CPPDUALS_BENCHMARK=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cppduals)
hunter_download(PACKAGE_NAME cppduals)
