# Copyright (c) 2019 Niall Douglas https://www.nedproductions.biz/
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    asio
    VERSION
    1.12.2-8d6df7b-p1
    URL
    "https://github.com/cpp-pm/asio/archive/v1.12.2-8d6df7b-p1.tar.gz"
    SHA1
    35f9abb8abaac541f168e7cc547a256b2ca6e2dd
)

hunter_add_version(
    PACKAGE_NAME
    asio
    VERSION
    1.17.0-p0
    URL
    "https://github.com/cpp-pm/asio/archive/v1.17.0-p0.tar.gz"
    SHA1
    21239ee00b2f765db4d3f2dcd9ee953c1650c3f1
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(asio)
hunter_download(PACKAGE_NAME asio)
