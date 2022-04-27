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
    1.6.0
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/tags/v1.6.0.tar.gz"
    SHA1
    a5ab9797a34b390236fdd52986ee792a6894221f
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(asio-grpc)
hunter_download(PACKAGE_NAME asio-grpc)
