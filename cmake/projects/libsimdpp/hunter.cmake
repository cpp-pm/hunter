# Copyright (c) 2017, Pawel Bylica

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libsimdpp
    VERSION
    2.1-p0
    URL
    "https://github.com/CHChang810716/libsimdpp/archive/v2.1-p0.tar.gz"
    SHA1
    0bf0a759fb4d41104e5d96bf85be8c2ef851d284
)
hunter_add_version(
    PACKAGE_NAME
    libsimdpp
    VERSION
    2.x-p0
    URL
    "https://github.com/CHChang810716/libsimdpp/archive/c81f999e51edd9fce76ab9c0e858cf64c2a14034.zip"
    SHA1
    ad22abd3e376ab38ab022af8695232df2c4b02fd
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libsimdpp)
hunter_download(PACKAGE_NAME libsimdpp)
