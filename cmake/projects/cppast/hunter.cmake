# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cppast
    VERSION
    0.0.0-b155d6a-p0
    URL
    "https://github.com/cpp-pm/cppast/archive/v0.0.0-b155d6a-p0.tar.gz"
    SHA1
    aaa370f185fb5d14398622863a35b5ebe96ab4a2
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cppast)
hunter_download(
    PACKAGE_NAME cppast
    PACKAGE_INTERNAL_DEPS_ID "1"
)
