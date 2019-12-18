# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Lager
    VERSION
    0.0.1-dbc1fde
    URL
    "https://github.com/arximboldi/lager/archive/dbc1fde8b323537154e351a24da34a485e2ccfa0.zip"
    SHA1
    4279a8c519dc4f1852d1f28f7f6cd0fb563ed26a
)

hunter_cmake_args(
    Lager
    CMAKE_ARGS
    lager_BUILD_TESTS=OFF
    lager_BUILD_EXAMPLES=OFF
    lager_BUILD_DOCS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Lager)
hunter_download(
    PACKAGE_NAME Lager
    PACKAGE_INTERNAL_DEPS_ID "1"
)
