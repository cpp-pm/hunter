# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    vurtun-lib
    VERSION
    0.0.0-f1cda26-p0
    URL
    "https://github.com/cpp-pm/vurtun-lib/archive/refs/tags/v0.0.0-f1cda26-p0.tar.gz"
    SHA1
    c59de030c43f008103d0fafad7f79f35e39476db
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(vurtun-lib)
hunter_download(PACKAGE_NAME vurtun-lib)
