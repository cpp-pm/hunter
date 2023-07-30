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

hunter_add_version(
    PACKAGE_NAME
    asio-grpc
    VERSION
    2.1.0
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/tags/v2.1.0.tar.gz"
    SHA1
    82f467d7649f76a8ed590180c72a5389685a855c
)

hunter_add_version(
    PACKAGE_NAME
    asio-grpc
    VERSION
    2.2.0
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/tags/v2.2.0.tar.gz"
    SHA1
    abc08e79c6344214b6bb846b390dd5de37f7fb00
)

hunter_add_version(
    PACKAGE_NAME
    asio-grpc
    VERSION
    2.3.0
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/tags/v2.3.0.tar.gz"
    SHA1
    0855a7c3eb90ebb8def23ed9c8d8332d17c6dece
)

hunter_add_version(
    PACKAGE_NAME
    asio-grpc
    VERSION
    2.4.0
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/tags/v2.4.0.tar.gz"
    SHA1
    85021b69a6ac3e6341813ee67f7142bf63ce5720
)

hunter_add_version(
    PACKAGE_NAME
    asio-grpc
    VERSION
    2.6.0
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/tags/v2.6.0.tar.gz"
    SHA1
    e86a68e4f6a2b37402fa78068912f6c2e7d3294f
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(asio-grpc)
hunter_download(PACKAGE_NAME asio-grpc)
