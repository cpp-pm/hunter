# Copyright (c) 2022, Raffael Casagrande
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    oneTBB
    VERSION
    2021.5.0
    URL
    "https://github.com/oneapi-src/oneTBB/archive/v2021.5.0.tar.gz"
    SHA1
    71750727bd1436f4047342d0adb827c25d7bc2b0
)

hunter_cmake_args(
  oneTBB
  CMAKE_ARGS
    TBB_TEST=OFF
    TBB_STRICT=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(oneTBB)
hunter_download(PACKAGE_NAME oneTBB)
