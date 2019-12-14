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
    "https://github.com/Bjoe/tiny-process-library/archive/1a4942fdb12d98c68b793f351ffb7f2664a818b1.zip"
    SHA1
    d354522ed46bb7df0e129ba3e74a5cb027ed126b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tiny-process-library)
hunter_download(
    PACKAGE_NAME tiny-process-library
    PACKAGE_INTERNAL_DEPS_ID "1"
)
