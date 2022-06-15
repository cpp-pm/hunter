# Copyright (c) 2014-2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tinyxml2
    VERSION
    "6.2.0-p1"
    URL
    "https://github.com/hunter-packages/tinyxml2/archive/v6.2.0-p1.tar.gz"
    SHA1
    "a457140cf6d889d71280433127eaac89cf04c94a"
)

hunter_add_version(
    PACKAGE_NAME
    tinyxml2
    VERSION
    "8.1.0"
    URL
    "https://github.com/leethomason/tinyxml2/archive/refs/tags/8.1.0.tar.gz"
    SHA1
    "0f165960e99ee6153939683b4cf208a899111ef3"
)

hunter_add_version(
    PACKAGE_NAME
    tinyxml2
    VERSION
    "9.0.0"
    URL
    "https://github.com/leethomason/tinyxml2/archive/refs/tags/9.0.0.tar.gz"
    SHA1
    "c3a0ba1e5e81f4297d3a796c397682ae3eeb8e89"
)

hunter_cmake_args(
    tinyxml2
    CMAKE_ARGS
    BUILD_TESTING:BOOL=false
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tinyxml2)
hunter_download(PACKAGE_NAME tinyxml2)
