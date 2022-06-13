# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME crc32c
    VERSION "1.0.5"
    URL "https://github.com/hunter-packages/crc32c/archive/refs/tags/hunter-1.0.5.tar.gz"
    SHA1 "dc7fa8cb877b9cb12a4e22e553087fdd6ce28cce")

hunter_add_version(
    PACKAGE_NAME crc32c
    VERSION "1.1.1"
    URL "https://github.com/google/crc32c/archive/1.1.1.tar.gz"
    SHA1 "46f18ed84a12c49c42dc77fff54491a9f8b9dce8")

hunter_cmake_args(crc32c CMAKE_ARGS
    CRC32C_BUILD_TESTS=OFF
    CRC32C_BUILD_BENCHMARKS=OFF
    CRC32C_USE_GLOG=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(crc32c)
hunter_download(PACKAGE_NAME crc32c)
