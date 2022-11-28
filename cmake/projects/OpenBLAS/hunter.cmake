# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_cmake_args)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.3.7
    URL
    "https://github.com/xianyi/OpenBLAS/archive/v0.3.7.tar.gz"
    SHA1
    6a79b36d1bf73584a513139806d226f9189d621e
)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.3.3
    URL
    "https://github.com/xianyi/OpenBLAS/archive/v0.3.3.tar.gz"
    SHA1
    bff159c528c1a860cee4976114d224da32d302a2
)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.3.1-p0
    URL
    "https://github.com/hunter-packages/OpenBLAS/archive/v0.3.1-p0.tar.gz"
    SHA1
    b525caa851e9cfb9e1756e42c8b4ee4877e98b9f
)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.3.0-p2
    URL
    "https://github.com/hunter-packages/OpenBLAS/archive/v0.3.0-p2.tar.gz"
    SHA1
    15875c6968eef0af7871d3cf91224570fece40cf
)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.2.20-p0
    URL
    "https://github.com/hunter-packages/OpenBLAS/archive/v0.2.20-p0.tar.gz"
    SHA1
    8f56263dda492f18972e55d51911a419d37eaba4
)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.2.19-p0
    URL
    "https://github.com/hunter-packages/OpenBLAS/archive/v0.2.19-p0.tar.gz"
    SHA1
    0d5ea6760304a2f76185e4e81959c0b2eb5bbc35
)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.3.21
    URL
    "https://github.com/xianyi/OpenBLAS/archive/v0.3.21.tar.gz"
    SHA1
    b052d196ad694b29302e074b3eb8cc66745f6e2f
)

hunter_configuration_types(OpenBLAS CONFIGURATION_TYPES Release)
if(HUNTER_OpenBLAS_VERSION VERSION_LESS 0.3.1)
  hunter_pick_scheme(DEFAULT OpenBLAS)
  set(
      _openblas_unrelocatable_text_files
      PACKAGE_UNRELOCATABLE_TEXT_FILES
      "lib/cmake/openblas/OpenBLASConfig.cmake"
  )
else()
  if(HUNTER_OpenBLAS_VERSION VERSION_LESS 0.3.21)
    set(_openblas_BUILD_WITHOUT_LAPACK "ON")
  else()
    # starting with 0.3.21 LAPACK support as a fallback with an
    # f2c-converted copy of LAPACK 3.9.0 was introduced
    # https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.21
    set(_openblas_BUILD_WITHOUT_LAPACK "OFF")
  endif()
  hunter_cmake_args(
    OpenBLAS
    CMAKE_ARGS
    BUILD_TESTING=OFF
    NOFORTRAN=1
    BUILD_WITHOUT_LAPACK=${_openblas_BUILD_WITHOUT_LAPACK}
  )
  hunter_pick_scheme(DEFAULT url_sha1_cmake)
  set(_openblas_unrelocatable_text_files "")
endif()
hunter_cacheable(OpenBLAS)
hunter_download(
    PACKAGE_NAME OpenBLAS
    PACKAGE_INTERNAL_DEPS_ID "2"
    ${_openblas_unrelocatable_text_files}
)
