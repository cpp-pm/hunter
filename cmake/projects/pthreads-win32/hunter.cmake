# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pthreads-win32
    VERSION
    2.9.1-7ad2af7-p0
    URL
    "https://github.com/cpp-pm/pthreads-win32/archive/refs/tags/v2.9.1-7ad2af7-p0.tar.gz"
    SHA1
    4d07ba41c074f4b35bce97a45ddee4856c4f7907
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(pthreads-win32)
hunter_download(PACKAGE_NAME pthreads-win32)
