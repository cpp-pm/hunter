# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    aws-sdk-cpp
    VERSION
    1.9.107
    URL
    "https://github.com/aws/aws-sdk-cpp.git"
    SHA1
    8dcef2f07164a1adf29e48ecfcd6d15b3d019705
)

hunter_cmake_args(
    aws-sdk-cpp
    CMAKE_ARGS
        ENABLE_TESTING=OFF
        AUTORUN_UNIT_TESTS=OFF
        BUILD_ONLY=s3
        HAS_MOUTLINE_ATOMICS=OFF # Avoid build error with -Werror on Intel
)

hunter_pick_scheme(DEFAULT git_tag_cmake)
hunter_cacheable(aws-sdk-cpp)
hunter_download(PACKAGE_NAME aws-sdk-cpp)
