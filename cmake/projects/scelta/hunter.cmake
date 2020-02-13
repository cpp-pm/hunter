# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    scelta
    VERSION
    0.1.0-a0f4f70-p0
    URL
    "https://github.com/cpp-pm/scelta/archive/v0.1-a0f4f70-p0.tar.gz"
    SHA1
    2b5abc5e577687757f4cc37d702e5903fb143a9a
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(scelta)
hunter_download(
    PACKAGE_NAME scelta
    PACKAGE_INTERNAL_DEPS_ID "1"
)
