# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    jpeg-compressor
    VERSION
    0.0.0-aeb7d3b-p0
    URL
    "https://github.com/cpp-pm/jpeg-compressor/archive/v0.0.0-aeb7d3b-p0.tar.gz"
    SHA1
    e7ae7f3d3cf9ebfacd2af0c2b9efbd976dcc9823
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(jpeg-compressor)
hunter_download(PACKAGE_NAME jpeg-compressor)
