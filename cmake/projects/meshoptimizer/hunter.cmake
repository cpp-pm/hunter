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
    meshoptimizer
    VERSION
    0.14-a507623-p0
    URL
    "https://github.com/cpp-pm/meshoptimizer/archive/v0.14-a507623-p0.tar.gz"
    SHA1
    d8e23cf64352a62a85ff10c7b4a0638231643a24
)

hunter_add_version(
    PACKAGE_NAME
    meshoptimizer
    VERSION
    0.16-86740c2-p0
    URL
    "https://github.com/cpp-pm/meshoptimizer/archive/refs/tags/v0.16-86740c2-p0.tar.gz"
    SHA1
    10b94ef45995fa8c06e90dcb656eb353017ef16a
)

if(ANDROID OR IOS)
  hunter_cmake_args(
    meshoptimizer
    CMAKE_ARGS
      MESHOPT_BUILD_DEMO=OFF
      MESHOPT_BUILD_GLTFPACK=OFF
      MESHOPT_BUILD_SHARED_LIBS=OFF
  )
else()
  hunter_cmake_args(
    meshoptimizer
    CMAKE_ARGS
      MESHOPT_BUILD_DEMO=OFF
      MESHOPT_BUILD_GLTFPACK=ON
      MESHOPT_BUILD_SHARED_LIBS=OFF
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(meshoptimizer)
hunter_download(PACKAGE_NAME meshoptimizer)
