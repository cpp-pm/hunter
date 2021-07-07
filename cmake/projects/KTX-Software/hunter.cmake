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
    KTX-Software
    VERSION
    4.0.0-efc9f09-p0
    URL
    "https://github.com/cpp-pm/KTX-Software/archive/refs/tags/v4.0.0-efc9f09-p0.tar.gz"
    SHA1
    e55bf10b4e97265de8475b4b68cd5b46e5f3e1cc
)

hunter_cmake_args(
    KTX-Software
    CMAKE_ARGS
        KTX_FEATURE_DOC=OFF
        KTX_FEATURE_LOADTEST_APPS=OFF
        KTX_FEATURE_STATIC_LIBRARY=ON
        KTX_FEATURE_TESTS=OFF
        KTX_FEATURE_TOOLS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(KTX-Software)
hunter_download(PACKAGE_NAME KTX-Software)
