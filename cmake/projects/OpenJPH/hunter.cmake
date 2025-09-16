# Copyright (c) 2025, NeroBurner
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    OpenJPH
    VERSION
    0.23.0
    URL
    "https://github.com/aous72/OpenJPH/archive/0.23.0.tar.gz"
    SHA1
    a702c867373b58dca9fe7a61f46b3ef440161d68
)

hunter_cmake_args(
    OpenJPH
    CMAKE_ARGS
    OJPH_ENABLE_TIFF_SUPPORT=NO # 0.23.0 not hunterized, no dependencies allowed
    OJPH_BUILD_EXECUTABLES=NO
    OJPH_BUILD_TESTS=NO
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenJPH)
hunter_download(PACKAGE_NAME OpenJPH)
