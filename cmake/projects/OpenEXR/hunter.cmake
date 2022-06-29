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

hunter_add_version(
    PACKAGE_NAME
    OpenEXR
    VERSION
    3.0.1-p0
    URL
    "https://github.com/cpp-pm/openexr/archive/refs/tags/v3.0.1-p0.tar.gz"
    SHA1
    0f7f5fb7479e447b150e69ee0dd299d486b7a4ef
)

hunter_add_version(
    PACKAGE_NAME
    OpenEXR
    VERSION
    3.1.0-p0
    URL
    "https://github.com/cpp-pm/openexr/archive/refs/tags/v3.1.0-p0.tar.gz"
    SHA1
    62551a5bde1e421c759c1cca950c9d4bfa407be6
)

hunter_add_version(
    PACKAGE_NAME
    OpenEXR
    VERSION
    3.1.4-p0
    URL
    "https://github.com/cpp-pm/openexr/archive/refs/tags/v3.1.4-p0.tar.gz"
    SHA1
    217394403320d7ac2e64088f556cf1750f9a3a74
)

hunter_add_version(
    PACKAGE_NAME
    OpenEXR
    VERSION
    3.1.5-p0
    URL
    "https://github.com/cpp-pm/openexr/archive/refs/tags/v3.1.5-p0.tar.gz"
    SHA1
    9c287054f1b2c0bb258c1a2832bad505f37fe30b
)

hunter_cmake_args(
    OpenEXR
    CMAKE_ARGS
        BUILD_TESTING=OFF
        INSTALL_OPENEXR_DOCS=OFF
        INSTALL_OPENEXR_EXAMPLES=OFF
        OPENEXR_BUILD_UTILS=OFF
        OPENEXR_INSTALL_EXAMPLES=OFF
)

if(HUNTER_OpenEXR_VERSION VERSION_LESS 3.0.0)
    hunter_source_subdir(
        OpenEXR
        SOURCE_SUBDIR "OpenEXR"
    )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenEXR)
hunter_download(PACKAGE_NAME OpenEXR)
