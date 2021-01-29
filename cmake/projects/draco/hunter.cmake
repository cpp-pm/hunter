# Copyright (c) 2016-2021, Ruslan Baratov, Rahul Sheth
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    draco
    VERSION
    1.3.4-p0
    URL
    "https://github.com/hunter-packages/draco/archive/v1.3.4-p0.tar.gz"
    SHA1
    64cd8ac43fc213ad4cb088aa7bba190adb87bb5d
)

hunter_add_version(
    PACKAGE_NAME
    draco
    VERSION
    1.4.1-p0
    URL
    "https://github.com/cpp-pm/draco/archive/v1.4.1-p0.tar.gz"
    SHA1
    1c37aba7278d7b8c729a98cc429d867626fa085c
)

hunter_cmake_args(
    draco
    CMAKE_ARGS
        DRACO_GLTF=ON
        DRACO_UNITY_PLUGIN=OFF
        DRACO_MAYA_PLUGIN=OFF
        DRACO_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(draco)
hunter_download(PACKAGE_NAME draco)
