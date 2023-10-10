# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    miniz
    VERSION
    2.1.0-5ebed82-p0
    URL
    "https://github.com/richgel999/miniz/archive/5ebed8288278fc0ff75d5f93ba95afc0416afe02.tar.gz"
    SHA1
    cabba521a61b9af353e197e74c1fa00307f33241
)

hunter_add_version(
    PACKAGE_NAME
    miniz
    VERSION
    3.0.2
    URL
    "https://github.com/richgel999/miniz/archive/refs/tags/3.0.2.tar.gz"
    SHA1
    4eca6e106380929fbd808d6170a2f1a63ad6165e
)

hunter_cmake_args(
    miniz
    CMAKE_ARGS
        AMALGAMATE_SOURCES=ON
        BUILD_EXAMPLES=OFF
        BUILD_SHARED_LIBS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(miniz)
hunter_download(PACKAGE_NAME miniz)
