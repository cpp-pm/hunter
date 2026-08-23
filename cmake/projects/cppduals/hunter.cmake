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
    0.9.2
    URL
    "https://gitlab.com/tesch1/cppduals/-/archive/v0.9.2/cppduals-v0.9.2.tar.gz"
    SHA1
    1478c1fe45269470182f0222056c27ab0e22dda8
)

hunter_add_version(
    PACKAGE_NAME
    cppduals
    VERSION
    0.9.3
    URL
    "https://gitlab.com/tesch1/cppduals/-/archive/v0.9.3/cppduals-v0.9.3.tar.gz"
    SHA1
    ae3a98f7b57eec650ceb7287af6113108e760778
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
