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
    fast_obj
    VERSION
    1.0-p0
    URL
    "https://github.com/cpp-pm/fast_obj/archive/v1.0-p0.tar.gz"
    SHA1
    1dc4c7dd587231496cddb7471d86d9d6c2b5e3d1
)

hunter_cmake_args(
    fast_obj
    CMAKE_ARGS
        BUILD_AS_LIBRARY=ON
        BUILD_SHARED_LIBS=OFF
        BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(fast_obj)
hunter_download(PACKAGE_NAME fast_obj)
