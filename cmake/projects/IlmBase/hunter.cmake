# Copyright (c) 2016-2019, Ruslan Baratov
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
    IlmBase
    VERSION
    2.4.0-p0
    URL
    "https://github.com/cpp-pm/openexr/archive/v2.4.0-p0.tar.gz"
    SHA1
    a99fb3c35b9d9c2e4aeb2cd38e7cb1149619ca0e
)

hunter_add_version(
    PACKAGE_NAME
    IlmBase
    VERSION
    2.4.0-p1
    URL
    "https://github.com/cpp-pm/openexr/archive/v2.4.0-p1.tar.gz"
    SHA1
    844f501f28b59caa3bcdf093dacae7a067429694
)

hunter_add_version(
    PACKAGE_NAME
    IlmBase
    VERSION
    2.5.1-p0
    URL
    "https://github.com/cpp-pm/openexr/archive/v2.5.1-p0.tar.gz"
    SHA1
    9a04f614f5fe7f3c916f0af59438c25cc9d59016
)

hunter_cmake_args(
    IlmBase
    CMAKE_ARGS
        BUILD_TESTING=OFF
)

hunter_source_subdir(
    IlmBase
    SOURCE_SUBDIR "IlmBase"
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(IlmBase)
hunter_download(PACKAGE_NAME IlmBase)
