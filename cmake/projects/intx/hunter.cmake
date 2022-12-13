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

hunter_add_version(
    PACKAGE_NAME
    intx
    VERSION
    0.6.0
    URL
    https://github.com/chfast/intx/archive/v0.6.0.tar.gz
    SHA1
    507827495de07412863349bc8c2a8704c7b0e5d4
)

hunter_add_version(
    PACKAGE_NAME
    intx
    VERSION
    0.7.1
    URL
    https://github.com/chfast/intx/archive/v0.7.1.tar.gz
    SHA1
    75f0d5e05df9245c7abc684dae2f4a99764c4ba8
)

hunter_add_version(
    PACKAGE_NAME
    intx
    VERSION
    0.8.0
    URL
    https://github.com/chfast/intx/archive/v0.8.0.tar.gz
    SHA1
    612c46d636d9e381a8288d96c70b132190a79ca8
)

hunter_add_version(
    PACKAGE_NAME
    intx
    VERSION
    0.9.0
    URL
    https://github.com/chfast/intx/archive/v0.9.0.tar.gz
    SHA1
    76b0c1698126e452f6067f701dd6e719db6e2254
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
