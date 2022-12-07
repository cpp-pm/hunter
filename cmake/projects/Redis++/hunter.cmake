# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  Redis++
  VERSION
  1.3.6
  URL
  "https://github.com/sewenew/redis-plus-plus/archive/refs/tags/1.3.6.tar.gz"
  SHA1
  650a9fc65c958119f5360ae7dc2341487a29ac6d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cmake_args(Redis++ CMAKE_ARGS REDIS_PLUS_PLUS_BUILD_ASYNC=libuv REDIS_PLUS_PLUS_BUILD_TEST=OFF CMAKE_PREFIX_PATH=${HUNTER_INSTALL_PREFIX})

hunter_cacheable(Redis++)
hunter_download(PACKAGE_NAME Redis++)
