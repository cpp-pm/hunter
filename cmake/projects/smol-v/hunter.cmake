# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    smol-v
    VERSION
    0.0.0-4b52c16-p0
    URL
    "https://github.com/cpp-pm/smol-v/archive/v0.0.0-4b52c16-p0.tar.gz"
    SHA1
    e5c2a74d2dc169d3c8a727b752a74e983b22d6a6
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(smol-v)
hunter_download(PACKAGE_NAME smol-v)
