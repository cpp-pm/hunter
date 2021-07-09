# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

 # !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    bento4
    VERSION
    "1.5.1-628-e6ee435-p0"
    URL
    "https://github.com/hunter-packages/Bento4/archive/v1.5.1-628-e6ee435-p0.tar.gz"
    SHA1
    9193721f6b7dce92afa01c37d6c28ddf55103ba5
)

hunter_add_version(
    PACKAGE_NAME
    bento4
    VERSION
    "1.6.0-638-p0"
    URL
    "https://github.com/cpp-pm/Bento4/archive/v1.6.0-638-p0.tar.gz"
    SHA1
    0c3e45f7652164fadbaf9283d143ff306e296f46
)

hunter_cmake_args(
    bento4
    CMAKE_ARGS
        BUILD_APPS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(bento4)
hunter_download(PACKAGE_NAME bento4)
