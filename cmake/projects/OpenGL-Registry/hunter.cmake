# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    OpenGL-Registry
    VERSION
    0.0.0-d15191e-p0
    URL
    "https://github.com/cpp-pm/OpenGL-Registry/archive/refs/tags/v0.0.0-d15191e-p0.tar.gz"
    SHA1
    841544bab9789c589012780a3e6a3e3ff50bce16
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenGL-Registry)
hunter_download(PACKAGE_NAME OpenGL-Registry)
