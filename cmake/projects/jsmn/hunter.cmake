# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    jsmn
    VERSION
    1.1.0-053d3cd-p0
    URL
    "https://github.com/cpp-pm/jsmn/archive/v1.1.0-053d3cd-p0.tar.gz"
    SHA1
    5a3b097e59975df1e0d1d5e3c27833c8869fbe09
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(jsmn)
hunter_download(PACKAGE_NAME jsmn)
