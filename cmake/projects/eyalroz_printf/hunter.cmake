# Copyright (c) 2024 Eyal Rozenberg <eyalroz1@gmx.com>
# Copyright (c) 2024 Alexander Voronov <kab00m@ya.ru>
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME eyalroz_printf
    VERSION "6.2.0"
    URL "https://github.com/eyalroz/printf/archive/refs/tags/v6.2.0.zip"
    SHA1 f60ce53b0d47e1ff0c4f54cd702a71eec362ffc6
)

hunter_cmake_args(
    eyalroz_printf
    CMAKE_ARGS
        BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(eyalroz_printf)
hunter_download(PACKAGE_NAME eyalroz_printf)

