# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    cgltf
    VERSION
    1.7-dc6b5f1-p0
    URL
    "https://github.com/cpp-pm/cgltf/archive/v1.7-dc6b5f1-p0.tar.gz"
    SHA1
    77210426575c8e08791fb8b5d4ef145dd67b3eb9
)

hunter_cmake_args(
    cgltf
    CMAKE_ARGS
        BUILD_AS_LIBRARY=ON
        BUILD_SHARED_LIBS=OFF
        BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cgltf)
hunter_download(PACKAGE_NAME cgltf)
