# Copyright (c) 2021 Niall Douglas https://www.nedproductions.biz/
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    gsl-lite
    VERSION
    0.40.0-p0
    URL
    "https://github.com/gsl-lite/gsl-lite/archive/refs/tags/v0.40.0.tar.gz"
    SHA1
    4e3820b13fdc414d489d30d445f51baa059aadc7
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gsl-lite)
hunter_download(PACKAGE_NAME gsl-lite)
