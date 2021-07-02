# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    KhronosDataFormat
    VERSION
    1.3.1-1f8c852-p0
    URL
    "https://github.com/cpp-pm/DataFormat/archive/v1.3.1-1f8c852-p0.tar.gz"
    SHA1
    ff706838e09646cd9bfa3930ccaf6d6d86e01dc6
)

hunter_add_version(
    PACKAGE_NAME
    KhronosDataFormat
    VERSION
    1.3.1-1f8c852-p1
    URL
    "https://github.com/cpp-pm/DataFormat/archive/v1.3.1-1f8c852-p1.tar.gz"
    SHA1
    41dd36ba55bd5c4defbd6fea5e0cffd9c81d62a5
)

hunter_add_version(
    PACKAGE_NAME
    KhronosDataFormat
    VERSION
    1.3.1-1f8c852-p2
    URL
    "https://github.com/cpp-pm/DataFormat/archive/v1.3.1-1f8c852-p2.tar.gz"
    SHA1
    18f38cbeb1644834ba7b3b464f7d1858446c19b1
)

hunter_add_version(
    PACKAGE_NAME
    KhronosDataFormat
    VERSION
    1.3.1-1f8c852-p3
    URL
    "https://github.com/cpp-pm/DataFormat/archive/v1.3.1-1f8c852-p3.tar.gz"
    SHA1
    bbf4e74024965a0873fe0677406e926ddb7af6e4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(KhronosDataFormat)
hunter_download(PACKAGE_NAME KhronosDataFormat)
