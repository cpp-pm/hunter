# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_download)
include(hunter_cacheable)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    libarchive
    VERSION
    "3.4.3"
    URL
    "https://libarchive.org/downloads/libarchive-3.4.3.tar.gz"
    SHA1
    6528f38fa03a44bfcf58435ec8512ffea2851c99
)

hunter_configuration_types(libarchive CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)

hunter_cmake_args(
    libarchive
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=libarchive
    EXTRA_FLAGS=--without-iconv
)

hunter_cacheable(libarchive)
hunter_download(
    PACKAGE_NAME libarchive
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libarchive.la"
    "lib/pkgconfig/libarchive.pc"
)
