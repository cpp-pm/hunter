# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    soralog
    VERSION
    "0.3.2"
    URL
    "https://github.com/xDimon/soralog/archive/refs/tags/v0.3.2.tar.gz"
    SHA1
    d8c9e4de276367f04e9d334953947a141e011a2e
)

hunter_cmake_args(
    soralog
    CMAKE_ARGS
        BUILD_TESTS=OFF
        BUILD_BENCHMARKS=OFF
        EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(soralog)
hunter_download(PACKAGE_NAME soralog)
