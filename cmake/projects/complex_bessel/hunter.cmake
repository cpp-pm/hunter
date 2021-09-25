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
   "0.5.0-abab4b5"
    URL
   "https://github.com/joeydumont/complex_bessel/archive/d08c44541a44c5a02490c698478bb5a8ec335861.tar.gz"
    SHA1
    58fedaab36b89c499f9bc73afaa5a36f16ef433c
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(complex_bessel)
hunter_download(PACKAGE_NAME complex_bessel)
