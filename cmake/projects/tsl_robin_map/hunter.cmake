# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tsl_robin_map
    VERSION
    0.6.3-dc2023b
    URL
    "https://github.com/Tessil/robin-map/archive/dc2023b02e35e51b386fbd7ab524b0f56d491965.tar.gz"
    SHA1
    f17356667cd0e7200eea58dcaf9c410176223199
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tsl_robin_map)
hunter_download(PACKAGE_NAME tsl_robin_map)
