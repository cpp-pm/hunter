# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Immer
    VERSION
    0.6.2-cf44615
    URL
    "https://github.com/arximboldi/immer/archive/cf446157834335887c2f89418e5dad3d00abfb85.zip"
    SHA1
    ec88a3d4757c931697f0f9e2aac70e1b50961cf0
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Immer)
hunter_download(
    PACKAGE_NAME Immer
    PACKAGE_INTERNAL_DEPS_ID "1"
)
