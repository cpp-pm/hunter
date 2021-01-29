# Copyright (c) 2016-2021, Ruslan Baratov, Rahul Sheth
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    draco
    VERSION
    1.3.4-p0
    URL
    "https://github.com/hunter-packages/draco/archive/v1.3.4-p0.tar.gz"
    SHA1
    64cd8ac43fc213ad4cb088aa7bba190adb87bb5d
)

hunter_add_version(
    PACKAGE_NAME
    draco
    VERSION
    1.4.1-p0
    URL
    "https://github.com/cpp-pm/draco/archive/v1.4.1-p0.tar.gz"
    SHA1
    03581af26f4f3bcf0141280a7c1ce2f6b79fb2cc
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(draco)
hunter_download(PACKAGE_NAME draco)
