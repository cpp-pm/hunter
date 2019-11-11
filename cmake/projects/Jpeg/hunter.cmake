# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Jpeg
    VERSION
    "9b-p3"
    URL
    "https://github.com/hunter-packages/jpeg/archive/v9b-p3.tar.gz"
    SHA1
    41f208215d59be34868c1f23b1fd0ee3f9934b9b
)

hunter_add_version(
    PACKAGE_NAME
    Jpeg
    VERSION
    "9b-p1"
    URL
    "https://github.com/hunter-packages/jpeg/archive/v9b-p1.tar.gz"
    SHA1
    81f4b7a189a12b7b5354232f133760e6840262b9
)

hunter_add_version(
    PACKAGE_NAME
    Jpeg
    VERSION
    "9b-p0"
    URL
    "https://github.com/hunter-packages/jpeg/archive/v9b-p0.tar.gz"
    SHA1
    70769f349fdf346851f2e7fc4c5f603cd8960ae4
)

hunter_add_version(
    PACKAGE_NAME
    Jpeg
    VERSION
    "9c-p0"
    URL
    "https://github.com/hunter-packages/jpeg/archive/v9c-p0.tar.gz"
    SHA1
    42ff243ae28bdda5b4df5c47fb727272a534dc94
)

hunter_add_version(
    PACKAGE_NAME
    Jpeg
    VERSION
    "turbo-2.0.3-p4"
    URL
    "https://github.com/cpp-pm/libjpeg-turbo/archive/v2.0.3-p4.tar.gz"
    SHA1
    75c9961f52ef9f79a79498e3d46f9107f467494d
)

string(FIND "${HUNTER_Jpeg_VERSION}" "turbo" HUNTER_Jpeg_IS_TURBO)
if(NOT HUNTER_Jpeg_IS_TURBO EQUAL -1)
  hunter_cmake_args(
    Jpeg
    CMAKE_ARGS
      ENABLE_SHARED=OFF
      ENABLE_STATIC=ON
      EXPORT_AS_JPEG=ON
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Jpeg)
hunter_download(PACKAGE_NAME Jpeg)
