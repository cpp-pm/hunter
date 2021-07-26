# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    FreeGLUT
    VERSION
    3.2.1-349a23d-p0
    URL
    "https://github.com/cpp-pm/FreeGLUT/archive/refs/tags/v3.2.1-349a23d-p0.tar.gz"
    SHA1
    b2841bf9697185b8c29adb56bb01d7a5668e9741
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(FreeGLUT)
hunter_download(PACKAGE_NAME FreeGLUT)
