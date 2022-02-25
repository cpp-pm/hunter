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

hunter_add_version(
    PACKAGE_NAME
    basis_universal
    VERSION
    1.15-p0
    URL
    "https://github.com/cpp-pm/basis_universal/archive/refs/tags/v1.15-p0.tar.gz"
    SHA1
    b453e7b1077f95ee4e5618f93712ea3a54d9aeb8
)

hunter_add_version(
    PACKAGE_NAME
    basis_universal
    VERSION
    1.15-c4c0db7-p0
    URL
    "https://github.com/cpp-pm/basis_universal/archive/refs/tags/v1.15-c4c0db7-p0.tar.gz"
    SHA1
    73b86006f65be61bbaf85cc17fe39247fe20a27b
)

hunter_add_version(
    PACKAGE_NAME
    basis_universal
    VERSION
    1.16.3-p0
    URL
    "https://github.com/cpp-pm/basis_universal/archive/refs/tags/v1.16.3-p0.tar.gz"
    SHA1
    eff867b8cf79480fa84011841aa258887ed57f7a
)

if(ANDROID OR IOS OR _hunter_windows_store)
  hunter_cmake_args(
      basis_universal
      CMAKE_ARGS
        BASISU_BUILD_TOOL=OFF
  )
else()
  hunter_cmake_args(
      basis_universal
      CMAKE_ARGS
        SSE=ON
        OPENCL=OFF
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(basis_universal)
hunter_download(PACKAGE_NAME basis_universal)
