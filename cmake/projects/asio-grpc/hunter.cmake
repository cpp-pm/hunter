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
    1.5.2
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/heads/master.zip"
    SHA1
    9169bcc78abec8a9e29b7b40d2a3351ac50d4870
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(asio-grpc)
hunter_download(PACKAGE_NAME asio-grpc)
