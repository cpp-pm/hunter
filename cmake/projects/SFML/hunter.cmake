include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SFML
    VERSION
    2.5.1-p0
    URL
    "https://github.com/cpp-pm/SFML/archive/2.5.1-p0.tar.gz"
    SHA1
    82b5aaf36717793bda31498a1630114296a99c68
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SFML)
hunter_download(PACKAGE_NAME SFML)
