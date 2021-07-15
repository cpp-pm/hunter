# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cpp-statsd-client
    VERSION
    1.0.2-03862e8
    URL
    "https://github.com/vthiery/cpp-statsd-client/archive/03862e84ed6619138c208f17e8118290735eed39.tar.gz"
    SHA1
    6f45cdb2a744fa988c1287f3b27ac7cd0eba63e6
)

hunter_add_version(
    PACKAGE_NAME
    cpp-statsd-client
    VERSION
    1.0.1-42f02b4-p0
    URL
    "https://github.com/cpp-pm/cpp-statsd-client/archive/v1.0.1-42f02b4-p0.tar.gz"
    SHA1
    a94f56a498defe4836f7bf605351924eb9c8e683
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cpp-statsd-client)
hunter_download(PACKAGE_NAME cpp-statsd-client)
