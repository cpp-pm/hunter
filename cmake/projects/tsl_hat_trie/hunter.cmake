# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tsl_hat_trie
    VERSION
    0.6.0-1739fa1-p0
    URL
    "https://github.com/cpp-pm/hat-trie/archive/v0.6.0-1739fa1-p0.tar.gz"
    SHA1
    2c1710a3e2fa46b9ff97ac92cad7da7da00cff56
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tsl_hat_trie)
hunter_download(PACKAGE_NAME tsl_hat_trie)
