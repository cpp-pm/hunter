# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)


hunter_add_version(
    PACKAGE_NAME
    ittapi
    VERSION
    05ac701
    URL
    "https://github.com/craffael/ittapi/archive/05ac701ea1277565d9b1f291ef29a09d4bb94a38.tar.gz"
    SHA1
    1aac4650befe3bf81e1869d402c4ee757f5fcb80
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ittapi)
hunter_download(PACKAGE_NAME ittapi)
