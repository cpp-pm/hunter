# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tinyrefl
    VERSION
    0.4.1-p0
    URL
    "https://github.com/cpp-pm/tinyrefl/archive/v0.4.1-p0.zip"
    SHA1
    8aa103cf3d0064cacca3188ef259d82dc9e9fa67
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tinyrefl)
hunter_download(
    PACKAGE_NAME tinyrefl
    PACKAGE_INTERNAL_DEPS_ID "1"
)
