# Added by Denis Kerzhemanov, 2015

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    lss
    VERSION
    "0.0.0-e1e7b0a-p0"
    URL
    "https://github.com/elisemorysc/linux-syscall-support/archive/refs/tags/e1e7b0a.tar.gz"
    SHA1
    e01747d397188c4f16c201d9f73b76f7cc654a1b
)

hunter_cacheable(lss)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME lss)
