# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    filament
    VERSION
    1.9.7
    URL
    "https://github.com/elisemorysc/filament/archive/hunter-v1.9.5.tar.gz"
    SHA1
    bc1835b7aafa1548b6b5ebf8d22879d2bfef3e85
)

hunter_cmake_args(
    filament
    CMAKE_ARGS
    FILAMENT_ENABLE_JAVA=OFF
    FILAMENT_SUPPORTS_VULKAN=OFF
    USE_STATIC_LIBCXX=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(filament)
hunter_download(PACKAGE_NAME filament)
