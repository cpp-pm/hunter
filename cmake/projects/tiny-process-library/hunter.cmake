# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tiny-process-library
    VERSION
    2.0.2
    URL
    "https://github.com/Bjoe/tiny-process-library/archive/624c2b61a32cb1544ec34f73bf1c5d87a8e2f19e.zip"
    SHA1
    218f8bb1fa327cc3be0bf9006b5b88b9572ed53c
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tiny-process-library)
hunter_download(
    PACKAGE_NAME tiny-process-library
    PACKAGE_INTERNAL_DEPS_ID "1"
)
