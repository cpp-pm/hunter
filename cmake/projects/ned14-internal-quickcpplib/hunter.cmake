# Copyright (c) 2021 Niall Douglas https://www.nedproductions.biz/
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_source_subdir)

hunter_add_version(
    PACKAGE_NAME
    ned14-internal-quickcpplib
    VERSION
    0.0.0-ef0fe8ec
    URL
    "https://github.com/ned14/quickcpplib/archive/ef0fe8ecf9951717b63b27447ddcaf5cc8eed6e2.tar.gz"
    SHA1
    3a36f46f4e03893d908894aa7e6d78f7ab1fe0bf
)

hunter_cmake_args(ned14-internal-quickcpplib CMAKE_ARGS
    PROJECT_IS_DEPENDENCY=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ned14-internal-quickcpplib)
hunter_download(PACKAGE_NAME ned14-internal-quickcpplib)
