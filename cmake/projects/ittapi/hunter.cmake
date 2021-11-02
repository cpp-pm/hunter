# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)


hunter_add_version(
    PACKAGE_NAME
    ittapi
    VERSION
    3.21.2-p0
    URL
    "https://github.com/cpp-pm/ittapi/archive/v3.21.2-p0.tar.gz"
    SHA1
    1a2ef8c2b50c42deec85a63a23fd7b7b0fbe75b0
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ittapi)
hunter_download(PACKAGE_NAME ittapi)
