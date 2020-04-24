# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libbacktrace
    VERSION
    1.0.0-ca0de051
    URL
    "https://github.com/ianlancetaylor/libbacktrace/archive/ca0de0517f3be44fedf5a2c01cfaf6437d4cae68.tar.gz"
    SHA1
    7c7db4d096d96f329c453fb97b7a456fe823e943
)

hunter_configuration_types(libbacktrace CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(libbacktrace)
hunter_download(
    PACKAGE_NAME libbacktrace
    PACKAGE_INTERNAL_DEPS_ID "1"
     PACKAGE_UNRELOCATABLE_TEXT_FILES
     "lib/libbacktrace.la"
)
