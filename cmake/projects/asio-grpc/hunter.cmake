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

hunter_add_version(
    PACKAGE_NAME
    asio-grpc
    VERSION
    1.7.0
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/tags/v1.7.0.tar.gz"
    SHA1
    0e636e89b5ba3a4b6bec07d793ecffe1c4cfada1
)

hunter_add_version(
    PACKAGE_NAME
    asio-grpc
    VERSION
    2.0.0
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/tags/v2.0.0.tar.gz"
    SHA1
    a727806a5c93c811e8f73ecb1e733efc4739d5ff
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(asio-grpc)
hunter_download(PACKAGE_NAME asio-grpc)
