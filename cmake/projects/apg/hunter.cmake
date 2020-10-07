# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    apg
    VERSION
    0.0.0-b322f7a-p0
    URL
    "https://github.com/cpp-pm/apg/archive/v0.0.0-b322f7a-p0.tar.gz"
    SHA1
    2ce4fa26b0548561b10d537e1477c711493e434d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(apg)
hunter_download(PACKAGE_NAME apg)

