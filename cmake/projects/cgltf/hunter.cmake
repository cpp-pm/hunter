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
    1.10-f9a8804-p0
    URL
    "https://github.com/cpp-pm/cgltf/archive/refs/tags/v1.10-f9a8804-p0.tar.gz"
    SHA1
    239dc691bd5ad663256eebb44f4641ad01d8ce9d
)

hunter_add_version(
    PACKAGE_NAME
    cgltf
    VERSION
    1.10-p0
    URL
    "https://github.com/cpp-pm/cgltf/archive/v1.10-p0.tar.gz"
    SHA1
    a575982916f3da8cdc0041783c6774dee07472de
)

hunter_add_version(
    PACKAGE_NAME
    cgltf
    VERSION
    1.9-p0
    URL
    "https://github.com/cpp-pm/cgltf/archive/v1.9-p0.tar.gz"
    SHA1
    c63d5c289a7de04e59f13939b441ec0859befdef
)

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
