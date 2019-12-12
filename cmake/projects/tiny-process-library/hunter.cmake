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
    "https://gitlab.com/eidheim/tiny-process-library/-/archive/v2.0.2/tiny-process-library-v2.0.2.tar.gz"
    SHA1
    380589052c93ca6815717d0fd62270c6dc867eef
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tiny-process-library)
hunter_download(
    PACKAGE_NAME tiny-process-library
    PACKAGE_INTERNAL_DEPS_ID "1"
)
