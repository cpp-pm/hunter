# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cppast
    VERSION
    0.0.1-RC
    URL
    "https://github.com/Bjoe/cppast/archive/dbbbe626e4cff9da83b1c0baba650fdd56df0cdc.zip"
    SHA1
    ac1733bcbaaba1e46005e2219e1499bbdcbbbe17
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cppast)
hunter_download(
    PACKAGE_NAME cppast
    PACKAGE_INTERNAL_DEPS_ID "1"
)
