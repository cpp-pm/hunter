# Copyright (c) 2022
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_source_subdir)

hunter_add_version(
    PACKAGE_NAME
    eventpp
    VERSION
    "0.1.2-for-hunter-pm"
    URL
    "https://github.com/wqking/eventpp/archive/refs/tags/v0.1.2-for-hunter-pm.tar.gz"
    SHA1
    0b3d8408c0f5868dfc35b9cd05b0a2da823b73bf
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(eventpp)
hunter_download(PACKAGE_NAME eventpp)
