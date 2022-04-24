# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
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
    1.5.1
    URL
    "https://github.com/Tradias/asio-grpc/archive/refs/heads/master.zip "
    SHA1
    c97d20fb2ffe36d32f5cab26b67f67ede89e91b9
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(asio-grpc)
hunter_download(PACKAGE_NAME asio-grpc)
