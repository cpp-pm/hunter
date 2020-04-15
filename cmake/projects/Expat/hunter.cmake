# Copyright (c) 2016, Alexander Lamaison
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
    Expat
    VERSION
    "2.1.0"
    URL
    "https://github.com/alamaison/expat/archive/R_2_1_0-hunter.tar.gz"
    SHA1
    87227472715212f636c624b656a86614519edcd5
)

hunter_add_version(
    PACKAGE_NAME
    Expat
    VERSION
    "2.1.1"
    URL
    "https://github.com/alamaison/expat/archive/R_2_1_1-hunter.tar.gz"
    SHA1
    6b7669be7bc36814c0a7a62cf17342d0a708a51a
)

hunter_add_version(
    PACKAGE_NAME
    Expat
    VERSION
    2.2.9-p0
    URL
    "https://github.com/cpp-pm/libexpat/archive/v2.2.9-p0.tar.gz"
    SHA1
    73c4c258dff36a68dda2f3c39a413ac602bfb47e
)

if(NOT HUNTER_Expat_VERSION VERSION_LESS 2.2.9)
    hunter_cmake_args(
        Expat
        CMAKE_ARGS
            EXPAT_BUILD_TOOLS=OFF
            EXPAT_BUILD_EXAMPLES=OFF
            EXPAT_BUILD_TESTS=OFF
            EXPAT_SHARED_LIBS=OFF
    )

    hunter_get_cmake_args(PACKAGE Expat OUT expat_cmake_args)
    string(FIND "${expat_cmake_args}" "BUILD_SHARED_LIBS=ON" expat_shared)

    if (expat_shared)
        option(EXPAT_SHARED_LIBS "build a shared expat library" ON)
    endif()

    hunter_source_subdir(
        Expat
        SOURCE_SUBDIR "expat"
    )
else()
    hunter_cmake_args(
        Expat
        CMAKE_ARGS
            BUILD_tools=OFF
            BUILD_examples=OFF
            BUILD_tests=OFF
            BUILD_shared=OFF
    )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Expat)
hunter_download(PACKAGE_NAME Expat)
