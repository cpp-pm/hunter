# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
#include(hunter_cmake_args)
#include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    scelta
    VERSION
    0.1.0-a0f4f70
    URL
    "https://github.com/Bjoe/scelta/archive/594aed957f4c2867243c08b73af49ef4d4599520.tar.gz"
    SHA1
    5a0fc037df80027af09de094875af8cac9b8d19f
)

#if (ANDROID OR IOS)
# hunter_cmake_args(
#    scelta
#    CMAKE_ARGS
#    PKGCONFIG_EXPORT_TARGETS=libfoo;libbar
#    DEPENDS_ON_PACKAGES=foo;bar
#    EXTRA_FLAGS=--enable-bots
# )
#endif()

#hunter_configuration_types(scelta CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(scelta)
hunter_download(
    PACKAGE_NAME scelta
    PACKAGE_INTERNAL_DEPS_ID "1"
#     PACKAGE_UNRELOCATABLE_TEXT_FILES
#     "lib/libfoo.la"
#     "lib/libpbar.la"
#     "lib/pkgconfig/libfoo.pc"
#     "lib/pkgconfig/libpbar.pc"
)
