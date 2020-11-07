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
    astc-encoder
    VERSION
    2.0-ab16aaa-p0
    URL
    "https://github.com/cpp-pm/astc-encoder/archive/v2.0-ab16aaa-p0.tar.gz"
    SHA1
    027d46d8c190cbfc3c7ab0b78a7773e534f9deec
)

hunter_add_version(
    PACKAGE_NAME
    astc-encoder
    VERSION
    1.3-a47b80f-p0
    URL
    "https://github.com/cpp-pm/astc-encoder/archive/v1.3-a47b80f-p0.tar.gz"
    SHA1
    6a181bffbacec7a6c2ee99a0c9bdb9da3de09c95
)

hunter_add_version(
    PACKAGE_NAME
    astc-encoder
    VERSION
    1.3-a47b80f-p1
    URL
    "https://github.com/cpp-pm/astc-encoder/archive/v1.3-a47b80f-p1.tar.gz"
    SHA1
    c01b9663ffd6e6a80cca985d24c4e77fcbaa65e7
)

if(ANDROID OR IOS)
  hunter_cmake_args(
    astc-encoder
    CMAKE_ARGS
      VEC=neon
      BUILD_APPS=OFF
  )
else()
  hunter_cmake_args(
    astc-encoder
    CMAKE_ARGS
      VEC=sse2
      BUILD_APPS=OFF
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(astc-encoder)
hunter_download(PACKAGE_NAME astc-encoder)
