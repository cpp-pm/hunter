# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tcmalloc
    VERSION
    "0.0.0-bc7995b-p0"
    URL
    "https://github.com/cpp-pm/tcmalloc/archive/0.0.0-bc7995b-p0.tar.gz"
    SHA1
    f42e1fec0ff66f3cb51648cc644efe3600b1b9f1
)


hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tcmalloc)
hunter_download(PACKAGE_NAME tcmalloc)
