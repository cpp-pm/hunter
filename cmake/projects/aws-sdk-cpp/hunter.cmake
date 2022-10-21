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
    "https://github.com/cpp-pm/aws-sdk-cpp.git"
    SHA1
    d0d1ad5cfa2130af33638ae42da022ce6d30c709
)

hunter_add_version(
    PACKAGE_NAME
    aws-sdk-cpp
    VERSION
    1.9.199-p0
    URL
    "https://github.com/cpp-pm/aws-sdk-cpp.git"
    SHA1
    dcd98ba988a49301c5459e1809984654ad381726
)

hunter_add_version(
    PACKAGE_NAME
    aws-sdk-cpp
    VERSION
    1.9.278-p0
    URL
    "https://github.com/cpp-pm/aws-sdk-cpp.git"
    SHA1
    5825fcbf56b004225ec096f21611d5e181ade456
)

hunter_add_version(
    PACKAGE_NAME
    aws-sdk-cpp
    VERSION
    1.9.278-p1
    URL
    "https://github.com/hjmallon/aws-sdk-cpp.git"
    SHA1
    da65b7edac9467265ea6cd762fbf20f5397e054b
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
