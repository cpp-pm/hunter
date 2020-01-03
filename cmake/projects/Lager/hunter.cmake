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
    "https://github.com/Bjoe/lager/archive/68e69c30667c12e01ef98a65e3ecef12c461f2e1.zip"
    SHA1
    0245b730277a4e4053215e90fd4dbd4fb43d3f5b
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
