# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tiny-process-library
    VERSION
    2.0.2-p0
    URL
    "https://github.com/cpp-pm/tiny-process-library/archive/v2.0.2-p0.tar.gz"
    SHA1
    cfe8bf3df785e819807e6c5363341d6427b47fae
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tiny-process-library)
hunter_download(
    PACKAGE_NAME tiny-process-library
    PACKAGE_INTERNAL_DEPS_ID "1"
)
