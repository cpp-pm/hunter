# Copyright (c) 2013-2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "1.1.0-b557259-p0"
    URL
    "https://github.com/cpp-pm/rapidjson/archive/refs/tags/v1.1.0-b557259-p0.tar.gz"
    SHA1
    93f271cf87bb866e11743af5d686252e4ecf5572
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "1.1.0-ce81bc9-p1"
    URL
    "https://github.com/cpp-pm/rapidjson/archive/v1.1.0-ce81bc9-p1.tar.gz"
    SHA1
    2fb99e1c64dcd6702a56efb1bea9341c67c1d6e3
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "1.1.0-66eb606-p0"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v1.1.0-66eb606-p0.tar.gz"
    SHA1
    6889242b198cbff7cd8610f214b4218436a4a7a9
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "1.1.0"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v1.1.0-p0.tar.gz"
    SHA1
    0d97a2d171d5a483338c21b6878f42ea5fe76503
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "1.0.2-p2"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p2.tar.gz"
    SHA1
    d7effe11a8af6c1a01abf3f9ac6ef1be84dc2c84
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "1.0.2-p1"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p1.tar.gz"
    SHA1
    0e2263566d45dcd4fc0419692a48010e27ffaee8
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "1.0.2-p0"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p0.tar.gz"
    SHA1
    587ef53d1b82b246f27967fa67eefc1f4c3d1719
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "0.11-p2"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v0.11-p2.tar.gz"
    SHA1
    bb0bfb8ad5cf2b575b57efbf2957619735a1696e
)

# C++ versions should be passed in by the toolchain.
# Since this is a header-only library, the RAPIDJSON_BUILD_CXX11 setting is irrelevant.
hunter_cmake_args(
    RapidJSON
    CMAKE_ARGS
    RAPIDJSON_BUILD_DOC=OFF
    RAPIDJSON_BUILD_EXAMPLES=OFF
    RAPIDJSON_BUILD_TESTS=OFF
    RAPIDJSON_BUILD_CXX11=OFF
    RAPIDJSON_HAS_STDSTRING=ON
    RAPIDJSON_NOMEMBERITERATORCLASS=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(RapidJSON)
hunter_download(PACKAGE_NAME RapidJSON)
