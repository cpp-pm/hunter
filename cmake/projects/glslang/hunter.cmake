# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    glslang
    VERSION
    7.12.3352-p1
    URL
    "https://github.com/cpp-pm/glslang/archive/v7.12.3352-p1.tar.gz"
    SHA1
    537a647b25a02d1a15bc3c87e3ed27b9a7db7982
)

hunter_add_version(
    PACKAGE_NAME
    glslang
    VERSION
    7.7.2767-p0
    URL
    "https://github.com/hunter-packages/glslang/archive/v7.7.2767-p0.tar.gz"
    SHA1
    44d6157e5bf6005f1f611bcea323488e6268d9c9
)

if(IOS OR ANDROID)
hunter_cmake_args(
    glslang
    CMAKE_ARGS
        BUILD_TESTING=OFF
        ENABLE_GLSLANG_BINARIES=OFF
)
else()
hunter_cmake_args(
    glslang
    CMAKE_ARGS
        BUILD_TESTING=OFF
)
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(glslang)
hunter_download(PACKAGE_NAME glslang)
