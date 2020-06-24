# Copyright (c) 2019, Pawel Bylica

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    intx
    VERSION
    0.1.0
    URL
    https://github.com/chfast/intx/archive/v0.1.0.tar.gz
    SHA1
    a70da498a9868e9484e01530c22690910d7222e6
)

hunter_add_version(
    PACKAGE_NAME
    intx
    VERSION
    0.2.0
    URL
    https://github.com/chfast/intx/archive/v0.2.0.tar.gz
    SHA1
    50c4d8ec601114755be9fd5bf5b288ee4eeacd54
)

hunter_add_version(
    PACKAGE_NAME
    intx
    VERSION
    0.3.0
    URL
    https://github.com/chfast/intx/archive/v0.3.0.tar.gz
    SHA1
    a8caffec14acbfead56edce78f360611aa4d252f
)

hunter_add_version(
    PACKAGE_NAME
    intx
    VERSION
    0.4.0
    URL
    https://github.com/chfast/intx/archive/v0.4.0.tar.gz
    SHA1
    8a2a0b0efa64899db972166a9b3568a6984c61bc
)

hunter_add_version(
    PACKAGE_NAME
    intx
    VERSION
    0.5.0
    URL
    https://github.com/chfast/intx/archive/v0.5.0.tar.gz
    SHA1
    7f917cfe9046278d348a5cf36c20f9847d351807
)

hunter_cmake_args(
    intx
    CMAKE_ARGS
    INTX_TESTING=OFF
    INTX_BENCHMARKING=OFF
    INTX_FUZZING=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(intx)
hunter_download(PACKAGE_NAME intx)
