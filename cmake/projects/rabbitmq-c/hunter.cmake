# Copyright (c) 2014-2015, Oliver Daniell
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    rabbitmq-c
    VERSION
    "0.7.0-p1"
    URL
    "https://github.com/oliverdaniell/rabbitmq-c/archive/v0.7.0-hunter-p1.tar.gz"
    SHA1
    89ba52ea76eb615fdbdb5aafa2a2b5037e67c303
)

hunter_add_version(
    PACKAGE_NAME
    rabbitmq-c
    VERSION
    "0.7.0"
    URL
    "https://github.com/alanxz/rabbitmq-c/archive/v0.7.0.tar.gz"
    SHA1
    28276bd11820b2cea714357eafe22f105358826a
)

hunter_add_version(
    PACKAGE_NAME
    rabbitmq-c
    VERSION
    "0.7.1"
    URL
    "https://github.com/alanxz/rabbitmq-c/archive/v0.7.1.tar.gz"
    SHA1
    038bb2a0d1b7f6bda287624c70a812028dfc2c4c
)

hunter_add_version(
    PACKAGE_NAME
    rabbitmq-c
    VERSION
    "0.8.0"
    URL
    "https://github.com/alanxz/rabbitmq-c/archive/v0.8.0.tar.gz"
    SHA1
    5f28b897986aa3300666bd6386bf0906a4482135
)

hunter_add_version(
    PACKAGE_NAME
    rabbitmq-c
    VERSION
    "0.9.0"
    URL
    "https://github.com/alanxz/rabbitmq-c/archive/v0.9.0.tar.gz"
    SHA1
    0709ef3c9906bd13158d3f9b11f1666bb3903f1d
)

hunter_add_version(
    PACKAGE_NAME
    rabbitmq-c
    VERSION
    "0.10.0"
    URL
    "https://github.com/alanxz/rabbitmq-c/archive/v0.10.0.tar.gz"
    SHA1
    6e39256e23cbcddfd2290b4300afd239b710885b
)

hunter_cmake_args(
  rabbitmq-c
  CMAKE_ARGS
    BUILD_SHARED_LIBS=ON
    BUILD_STATIC_LIBS=ON
    BUILD_EXAMPLES=OFF
    BUILD_TOOLS=OFF
    BUILD_TOOLS_DOCS=OFF
    BUILD_TESTS=OFF
    BUILD_API_DOCS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME rabbitmq-c)
