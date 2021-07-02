# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    EGL-Registry
    VERSION
    0.0.0-dc0b58d-p0
    URL
    "https://github.com/cpp-pm/EGL-Registry/archive/refs/tags/v0.0.0-dc0b58d-p0.tar.gz"
    SHA1
    f5d27a0d6c0edf99c54db73c711ee910c3f49281
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(EGL-Registry)
hunter_download(PACKAGE_NAME EGL-Registry)
