# Copyright (c) 2014-2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.8-hunter"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.8-hunter.tar.gz"
    SHA1
    75a05fcc928ed52e1eeb93f07a1c78a7890860c0
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.8-hunter-1"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.8-hunter-1.tar.gz"
    SHA1
    24c89e4b193a56bb411fa9878968002ebe2c6209
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.8-p2"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.8-p2.tar.gz"
    SHA1
    bef3ee6d68a271dfcd2f659c80d721d4a6b39315
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.8-p3"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz"
    SHA1
    573dc28474be47d0c7abc1475a14aa12f0dfcadc
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.11-p0"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.11-p0.tar.gz"
    SHA1
    9ced8b310aa341af7f3584bac0b2d2a669d2178b
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "1.2.11-p1"
    URL
    "https://github.com/hunter-packages/zlib/archive/v1.2.11-p1.tar.gz"
    SHA1
    fbb8be77db5cb3f4d1b269f273a357d22ccc4b32
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "0.0.0-chromium-f87c2b10efb4-p0"
    URL
    "https://github.com/hunter-packages/chromium_zlib/archive/v0.0.0-f87c2b10efb4-p0.tar.gz"
    SHA1
    2fc1f19ef5ba48c415a614e56e1c12507f4676ab
)

hunter_add_version(
    PACKAGE_NAME
    ZLIB
    VERSION
    "0.0.0-chromium-f87c2b10efb4-p2"
    URL
    "https://github.com/cpp-pm/chromium_zlib/archive/v0.0.0-f87c2b10efb4-p2.tar.gz"
    SHA1
    20019f1dbfb154956067aa1df0e73e5185d794fa
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ZLIB)
string(FIND "${HUNTER_ZLIB_VERSION}" "chromium" HUNTER_ZLIB_IS_CHROMIUM)
if(NOT HUNTER_ZLIB_IS_CHROMIUM EQUAL -1)
  # Is a chromium variant
  hunter_download(PACKAGE_NAME ZLIB
    PACKAGE_INTERNAL_DEPS_ID "1"
  )
else()
  # Is a standard variant
  hunter_download(PACKAGE_NAME ZLIB
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "share/pkgconfig/zlib.pc"
  )
endif()
