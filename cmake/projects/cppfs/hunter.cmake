# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cppfs
    VERSION
    1.3.0
    URL
    "https://github.com/cginternals/cppfs/archive/v1.3.0.zip"
    SHA1
    b7ac401ba784c691546cd087a76701c39ed8f418
)

hunter_cmake_args(
   cppfs
   CMAKE_ARGS
    OPTION_BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cppfs)
hunter_download(
    PACKAGE_NAME cppfs
    PACKAGE_INTERNAL_DEPS_ID "1"
)
