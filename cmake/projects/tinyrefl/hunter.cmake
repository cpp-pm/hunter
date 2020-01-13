# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
#include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tinyrefl
    VERSION
    0.4.1-p0
    URL
    "https://github.com/Bjoe/tinyrefl/archive/a91a16a92028c2dac7ec4ad4938d2b5b9891f94e.zip"
    SHA1
    a1c00a757742dfa0bc7fc9f29eb3bc1156016db8
)

#if (ANDROID OR IOS)
# hunter_cmake_args(
#    tinyrefl
#    CMAKE_ARGS
#    PKGCONFIG_EXPORT_TARGETS=libfoo;libbar
#    DEPENDS_ON_PACKAGES=foo;bar
#    EXTRA_FLAGS=--enable-bots
# )
#endif()

#hunter_configuration_types(tinyrefl CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tinyrefl)
hunter_download(
    PACKAGE_NAME tinyrefl
    PACKAGE_INTERNAL_DEPS_ID "1"
#     PACKAGE_UNRELOCATABLE_TEXT_FILES
#     "lib/libfoo.la"
#     "lib/libpbar.la"
#     "lib/pkgconfig/libfoo.pc"
#     "lib/pkgconfig/libpbar.pc"
)
