# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libjpeg-turbo
    VERSION
    2.0.3-p0
    URL
    "https://github.com/hunter-packages/libjpeg-turbo/archive/v2.0.3-p0.tar.gz"
    SHA1
    7b1a439887a71a72da087cce71396fadd81008a2
)

hunter_add_version(
    PACKAGE_NAME
    libjpeg-turbo
    VERSION
    2.0.90
    URL
    "https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/2.0.90.tar.gz"
    SHA1
    e741b344bac3fbccdf4ec622bce02a5f4275cefe
)

hunter_add_version(
    PACKAGE_NAME
    libjpeg-turbo
    VERSION
    2.1.0
    URL
    "https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/2.1.0.tar.gz"
    SHA1
    40daf166fb943a6601190e6cfab0f48b2b674e58
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cmake_args(
    libjpeg-turbo
    CMAKE_ARGS ENABLE_SHARED=OFF
)

hunter_cacheable(libjpeg-turbo)
hunter_download(PACKAGE_NAME libjpeg-turbo)
