# Copyright (c) 2022, Tradias
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    asio-grpc
    VERSION
    1.5.3
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/heads/master.zip"
    SHA1
    1504f6cc0c9869b317fa09237f7e169efda8dc97
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(asio-grpc)
hunter_download(PACKAGE_NAME asio-grpc)
