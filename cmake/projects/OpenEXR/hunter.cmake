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
    OpenEXR
    VERSION
    2.4.0-p1
    URL
    "https://github.com/cpp-pm/openexr/archive/v2.4.0-p1.tar.gz"
    SHA1
    844f501f28b59caa3bcdf093dacae7a067429694
)

hunter_add_version(
    PACKAGE_NAME
    OpenEXR
    VERSION
    2.5.1-p0
    URL
    "https://github.com/cpp-pm/openexr/archive/v2.5.1-p0.tar.gz"
    SHA1
    9a04f614f5fe7f3c916f0af59438c25cc9d59016
)

hunter_cmake_args(
    OpenEXR
    CMAKE_ARGS
        BUILD_TESTING=OFF
        INSTALL_OPENEXR_DOCS=OFF
        INSTALL_OPENEXR_EXAMPLES=OFF
        OPENEXR_BUILD_UTILS=OFF
)

hunter_source_subdir(
    OpenEXR
    SOURCE_SUBDIR "OpenEXR"
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenEXR)
hunter_download(PACKAGE_NAME OpenEXR)
