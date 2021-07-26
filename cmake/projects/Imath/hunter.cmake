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
    Imath
    VERSION
    3.1.1
    URL
    "https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.1.1.tar.gz"
    SHA1
    1f6812637a1ec2a518cd4445ef31808fe1dc4a29
)

hunter_add_version(
    PACKAGE_NAME
    Imath
    VERSION
    3.0.1
    URL
    "https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.0.1.tar.gz"
    SHA1
    967271b4b04b62014bd321958d73c77c22e60eb6
)

hunter_cmake_args(
    Imath
    CMAKE_ARGS
        BUILD_TESTING=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Imath)
hunter_download(PACKAGE_NAME Imath)
