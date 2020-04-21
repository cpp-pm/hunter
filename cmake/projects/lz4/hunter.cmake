# Copyright (c) 2016-2017, Ruslan Baratov
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
    lz4
    VERSION
    1.8.0-p1
    URL
    "https://github.com/hunter-packages/lz4/archive/v1.8.0-p1.tar.gz"
    SHA1
    00b58d5f28404ed1fdd3410468ebaa44c2ad8a16
)

hunter_add_version(
    PACKAGE_NAME
    lz4
    VERSION
    1.8.0-p2
    URL
    "https://github.com/hunter-packages/lz4/archive/v1.8.0-p2.tar.gz"
    SHA1
    e96abaedd5d8a5a61c21316c8bb173b1954c7c6b
)

hunter_add_version(
    PACKAGE_NAME
    lz4
    VERSION
    1.9.2-p0
    URL
    "https://github.com/cpp-pm/lz4/archive/v1.9.2-p0.tar.gz"
    SHA1
    0fc022c98ecd741bc5dda3cafeebfc9290b82983
)

if(NOT HUNTER_lz4_VERSION VERSION_LESS 1.9.2)
    hunter_cmake_args(
        lz4
        CMAKE_ARGS
            LZ4_INSTALL_BINARIES=OFF
    )

    hunter_source_subdir(
        lz4
        SOURCE_SUBDIR "contrib/cmake_unofficial"
    )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lz4)
hunter_download(PACKAGE_NAME lz4)
