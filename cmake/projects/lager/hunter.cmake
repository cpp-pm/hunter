# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
#include(hunter_cmake_args)
#include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    lager
    VERSION
    0.0.1-dbc1fde
    URL
    "https://github.com/arximboldi/lager/archive/dbc1fde8b323537154e351a24da34a485e2ccfa0.zip"
    SHA1
    4279a8c519dc4f1852d1f28f7f6cd0fb563ed26a
)

#if (ANDROID OR IOS)
# hunter_cmake_args(
#    lager
#    CMAKE_ARGS
#    PKGCONFIG_EXPORT_TARGETS=libfoo;libbar
#    DEPENDS_ON_PACKAGES=foo;bar
#    EXTRA_FLAGS=--enable-bots
# )
#endif()

#hunter_configuration_types(lager CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lager)
hunter_download(
    PACKAGE_NAME lager
    PACKAGE_INTERNAL_DEPS_ID "1"
#     PACKAGE_UNRELOCATABLE_TEXT_FILES
#     "lib/libfoo.la"
#     "lib/libpbar.la"
#     "lib/pkgconfig/libfoo.pc"
#     "lib/pkgconfig/libpbar.pc"
)
