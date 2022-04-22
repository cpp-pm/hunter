# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Banking
    VERSION
    1.0.1
    URL
    "https://github.com/undefinedev/Banking/archive/v1.0.1.tar.gz"
    SHA1
    552af4b4e5f344c3b782a047a869c4130763fb6d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Banking)
hunter_download(PACKAGE_NAME Banking)
