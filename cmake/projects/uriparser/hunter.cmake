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
    uriparser
    VERSION
    0.9.5
    URL
    "https://github.com/uriparser/uriparser/releases/download/uriparser-0.9.5/uriparser-0.9.5.tar.gz"
    SHA1
    52fb2c2137e4d4255c2ad8a570e7ca74f933695b
)

hunter_cmake_args(
    uriparser
    CMAKE_ARGS
        URIPARSER_BUILD_DOCS=OFF
        URIPARSER_BUILD_TESTS=OFF
        URIPARSER_BUILD_TOOLS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(uriparser)
hunter_download(PACKAGE_NAME uriparser)
