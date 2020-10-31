# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    freetype-gl
    VERSION
    "0.0.0-1a8c007-p0" #project has no releases so using 0.0.0-commit-patch
    URL
    "https://github.com/cpp-pm/freetype-gl/archive/v0.0.0-1a8c007-p0.tar.gz"
    SHA1
    923b6a4fad097beefa6aa6c759e7fa4010bf9214
)

hunter_cmake_args(
    freetype-gl
    CMAKE_ARGS
    freetype-gl_USE_HUNTER=ON
    freetype-gl_BUILD_DEMOS=OFF
    freetype-gl_BUILD_TESTS=OFF
    freetype-gl_BUILD_APIDOC=OFF
    freetype-gl_BUILD_MAKEFONT=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(freetype-gl)
hunter_download(PACKAGE_NAME freetype-gl)
