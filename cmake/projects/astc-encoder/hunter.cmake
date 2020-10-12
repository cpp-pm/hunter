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
    a402d69bd5d711438d1bd60445f754e379ad790f
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
