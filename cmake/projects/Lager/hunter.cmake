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
    0.0.0-dbc1fde-p0
    URL
    "https://github.com/cpp-pm/lager/archive/v0.0.0-dbc1fde.tar.gz"
    SHA1
    1b20b2d29d7886eed48d57fefdcb322885b84ae9
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
