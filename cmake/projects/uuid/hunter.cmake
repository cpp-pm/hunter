# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    uuid
    VERSION
    1.0.3
    URL
    "https://sourceforge.net/projects/libuuid/files/libuuid-1.0.3.tar.gz/download"
    SHA1
    46eaedb875ae6e63677b51ec583656199241d597
)

hunter_cmake_args(
    uuid
    CMAKE_ARGS
       PKGCONFIG_EXPORT_TARGETS=uuid
)

hunter_configuration_types(uuid CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(uuid)
hunter_download(
    PACKAGE_NAME uuid
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
     "lib/libuuid.la"
     "lib/pkgconfig/uuid.pc"
)
