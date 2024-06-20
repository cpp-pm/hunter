# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)

hunter_add_version(
  PACKAGE_NAME
  HiRedis
  VERSION
  1.1.0
  URL
  "https://github.com/redis/hiredis/archive/refs/tags/v1.1.0.tar.gz"
  SHA1
  6b3bae35134d2c0b3b1d884e157cfb03c90412da
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cmake_args(HiRedis CMAKE_ARGS DISABLE_TESTS=ON)

hunter_cacheable(HiRedis)
hunter_download(PACKAGE_NAME HiRedis)
