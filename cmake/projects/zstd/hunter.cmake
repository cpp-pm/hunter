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

hunter_add_version(
    PACKAGE_NAME
    zstd
    VERSION
    1.4.8
    URL
    "https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz"
    SHA1
    2b79c836ed2e11956ebd112ddc731f1954b4074c
)

hunter_add_version(
    PACKAGE_NAME
    zstd
    VERSION
    1.5.0
    URL
    "https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz"
    SHA1
    c53019729e3a595f0104facab6533d78296a2945
)

hunter_add_version(
    PACKAGE_NAME
    zstd
    VERSION
    1.5.1
    URL
    "https://github.com/facebook/zstd/releases/download/v1.5.1/zstd-1.5.1.tar.gz"
    SHA1
    e6a51ef3f7d5be5b74ac74d88bf3850057e00adb
)

hunter_add_version(
    PACKAGE_NAME
    zstd
    VERSION
    1.5.2
    URL
    "https://github.com/facebook/zstd/releases/download/v1.5.2/zstd-1.5.2.tar.gz"
    SHA1
    c56c8e6d703d14029464b2a1a66164dc5cf80855
)

hunter_add_version(
    PACKAGE_NAME
    zstd
    VERSION
    1.5.4
    URL
    "https://github.com/facebook/zstd/releases/download/v1.5.4/zstd-1.5.4.tar.gz"
    SHA1
    128aa7c9305b8d13b1ba8a88766492a779cebe40
)

hunter_add_version(
    PACKAGE_NAME
    zstd
    VERSION
    1.5.5
    URL
    "https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz"
    SHA1
    4479ecc74300d23391d99fbebf2fddd47aed9b28
)

hunter_source_subdir(zstd SOURCE_SUBDIR "build/cmake")

hunter_cmake_args(zstd CMAKE_ARGS
    ZSTD_BUILD_PROGRAMS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(zstd)
hunter_download(PACKAGE_NAME zstd)
