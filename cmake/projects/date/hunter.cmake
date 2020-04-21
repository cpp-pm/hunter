# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    date
    VERSION
    2.4.1
    URL
    "https://github.com/HowardHinnant/date/archive/v2.4.1.tar.gz"
    SHA1
    4ed983e1d19ee28bc565bd62907d203304b38cf7
)

hunter_add_version(
    PACKAGE_NAME
    date
    VERSION
    2.4.1-e12095f
    URL
    "https://github.com/HowardHinnant/date/tarball/e12095f26fd523d13e7cffbc87b79775ce2a6f53"
    SHA1
    00603b84f7bc99453f5edafe1c5caa72120f5c9d
)

hunter_cmake_args(date CMAKE_ARGS ENABLE_DATE_TESTING=OFF USE_SYSTEM_TZ_DB=ON)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(date)
hunter_download(PACKAGE_NAME date)
