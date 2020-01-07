# Copyright (c) 2016-2019, Ruslan Baratov
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
    IlmBase
    VERSION
    2.4.0
    URL
    "https://github.com/cpp-pm/openexr/archive/v2.4.0-p0.tar.gz"
    SHA1
    a99fb3c35b9d9c2e4aeb2cd38e7cb1149619ca0e
)

hunter_cmake_args(
    IlmBase
    CMAKE_ARGS
        BUILD_TESTING=OFF
)

hunter_source_subdir(
    IlmBase
    SOURCE_SUBDIR "IlmBase"
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(IlmBase)
hunter_download(PACKAGE_NAME IlmBase)
