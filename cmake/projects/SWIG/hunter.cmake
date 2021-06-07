# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SWIG
    VERSION
    v4.0.2
    URL
    "https://github.com/swig/swig/archive/refs/tags/v4.0.2.tar.gz"
    SHA1
    d7604385afca1221d2ba71040b425b2a4bf75125
)

hunter_cmake_args(
    SWIG
    CMAKE_ARGS
        FOO_BUILD_EXAMPLES=OFF
        FOO_BUILD_TESTS=OFF
        FOO_BUILD_DOCUMENTATION=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SWIG)
hunter_configuration_types(foo CONFIGURATION_TYPES Release)
hunter_download(PACKAGE_NAME SWIG)
