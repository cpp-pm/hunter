# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    complex_bessel
    VERSION
    "0.5.0-4199061"
    URL
    "https://github.com/joeydumont/complex_bessel/archive/4199061675fd2e8784daca5d85d6454571b86448.tar.gz"
    SHA1
    9fe22d021a183b5abc8f84d42c255dc54537dc72
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(complex_bessel)
hunter_download(PACKAGE_NAME complex_bessel)
