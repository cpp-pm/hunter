# Copyright (c) 2023 Alexander Voronov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)
include(hunter_status_debug)

hunter_add_version(
    PACKAGE_NAME eyalroz_printf
    VERSION "6.2.0-b1"
    URL "https://github.com/eyalroz/printf/archive/refs/tags/v6.2.0-b1.zip"
    SHA1 4f2e2bbfffb9f6db46d87c5152ce17dd9f7053d5
)

hunter_cmake_args(
    eyalroz_printf 
    CMAKE_ARGS 
        BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(eyalroz_printf)
hunter_download(PACKAGE_NAME eyalroz_printf)

