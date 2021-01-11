# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)
include(hunter_status_debug)

hunter_add_version(
    PACKAGE_NAME
    termcolor
    VERSION
    "1.0.0"
    URL
    "https://github.com/ikalnytskyi/termcolor/archive/v1.0.0.tar.gz"
    SHA1
    3ecab2daf39f118bff2244f51760dfd32ab7a3d1
)

hunter_add_version(
    PACKAGE_NAME
    termcolor
    VERSION
    "1.0.1"
    URL
    "https://github.com/ikalnytskyi/termcolor/archive/v1.0.1.tar.gz"
    SHA1
    c49b9d07c3240ba624e6471a5e461ecaa2fc7dc2
)

hunter_cmake_args(termcolor CMAKE_ARGS ENABLE_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(termcolor)
hunter_download(PACKAGE_NAME termcolor)
