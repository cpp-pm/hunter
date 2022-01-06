# Copyright (c) 2021 Niall Douglas https://www.nedproductions.biz/
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    byte-lite
    VERSION
    0.3.0-p0
    URL
    "https://github.com/martinmoene/byte-lite/archive/refs/tags/v0.3.0.tar.gz"
    SHA1
    8a1d64fa8af6b304a9299cc5a02066b04efa63b8
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(byte-lite)
hunter_download(PACKAGE_NAME byte-lite)
