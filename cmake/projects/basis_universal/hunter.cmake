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
    basis_universal
    VERSION
    1.12-f80f8dd-p2
    URL
    "https://github.com/cpp-pm/basis_universal/archive/v1.12-f80f8dd-p2.tar.gz"
    SHA1
    e2ec4b09138a18b5f4c475fdcff39175b2077c05
)

if(ANDROID OR IOS OR _hunter_windows_store)
  hunter_cmake_args(
      basis_universal
      CMAKE_ARGS
        BASISU_BUILD_TOOL=OFF
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(basis_universal)
hunter_download(PACKAGE_NAME basis_universal)
