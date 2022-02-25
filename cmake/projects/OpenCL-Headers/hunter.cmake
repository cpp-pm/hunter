# Copyright (c) 2016-2022, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    OpenCL-Headers
    VERSION
    2022.01.04
    URL
    "https://github.com/KhronosGroup/OpenCL-Headers/archive/refs/tags/v2022.01.04.tar.gz"
    SHA1
    6125bcd4a98f14d2687203cc9401410deadfacea
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenCL-Headers)
hunter_download(PACKAGE_NAME OpenCL-Headers)
