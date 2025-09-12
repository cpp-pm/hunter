# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# need to use hunter fork, v1.24 isn't relocatable yet
# open PR: https://github.com/ebiggers/libdeflate/pull/434
hunter_add_version(
    PACKAGE_NAME
    libdeflate
    VERSION
    1.24-p0
    URL
    "https://github.com/cpp-pm/libdeflate/archive/refs/tags/v1.24-p0.tar.gz"
    SHA1
    07f1a72f3938377615da6e4bb48be77d1e8938a4
)

hunter_cmake_args(
    libdeflate
    CMAKE_ARGS
    LIBDEFLATE_BUILD_STATIC_LIB=YES
    LIBDEFLATE_BUILD_SHARED_LIB=NO
    LIBDEFLATE_USE_SHARED_LIB=NO
    LIBDEFLATE_BUILD_TESTS=NO
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libdeflate)
hunter_download(PACKAGE_NAME libdeflate)
