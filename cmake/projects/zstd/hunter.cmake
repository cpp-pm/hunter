# Copyright (c) 2019 Niall Douglas https://www.nedproductions.biz/
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_source_subdir)

hunter_add_version(
    PACKAGE_NAME
    zstd
    VERSION
    1.4.5-d73e2fb-p0
    URL
    "https://github.com/facebook/zstd/archive/d73e2fb465c9289f5a6871cef1fe48de917a5cc2.tar.gz"
    SHA1
    e770f4ff39ca7b40790e2fe61339cc84b63c0a8d
)

hunter_add_version(
    PACKAGE_NAME
    zstd
    VERSION
    1.4.5
    URL
    "https://github.com/facebook/zstd/releases/download/v1.4.5/zstd-1.4.5.tar.gz"
    SHA1
    8059ef26c3d7dffa4d6dad64511c0675e46c0da6
)

hunter_source_subdir(zstd SOURCE_SUBDIR "build/cmake")

hunter_cmake_args(zstd CMAKE_ARGS
    ZSTD_BUILD_PROGRAMS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(zstd)
hunter_download(PACKAGE_NAME zstd)
