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
    ba1077f95de6787a9c1ef150424bfee55ddca5e1
    URL
    "https://github.com/Thalhammer/jwt-cpp/archive/ba1077f95de6787a9c1ef150424bfee55ddca5e1.tar.gz"
    SHA1
    012ff818c3089b8b29db87a31ad19df55ebec929
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
