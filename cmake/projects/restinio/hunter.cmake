# Copyright (c) 2021 Niall Douglas https://www.nedproductions.biz/
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    restinio
    VERSION
    0.6.14
    URL
    "https://github.com/cpp-pm/restinio/archive/0.6.14-hunter.tar.gz"
    SHA1
    9d74b30969162a4506a7f516105a9404cafd6fc5
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(restinio)
hunter_download(PACKAGE_NAME restinio)
