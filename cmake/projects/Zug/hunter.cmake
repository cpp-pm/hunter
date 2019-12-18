# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Zug
    VERSION
    0.0.1-be20cae
    URL
    "https://github.com/arximboldi/zug/archive/be20cae36e7e5876bf5bfb08b2a0562e1db3b546.zip"
    SHA1
    2d129f233691e0abca99e039bbe66e46e0be74a1
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Zug)
hunter_download(
    PACKAGE_NAME Zug
    PACKAGE_INTERNAL_DEPS_ID "1"
)
