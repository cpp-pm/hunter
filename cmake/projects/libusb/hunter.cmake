# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libusb
    VERSION
    1.0.22
    URL
    "https://github.com/libusb/libusb/archive/v1.0.22.tar.gz"
    SHA1
    cdb45a2d679e2ccbc3a8193f843e3f0c7187f74c
)

hunter_add_version(
    PACKAGE_NAME
    libusb
    VERSION
    1.0.23
    URL
    "https://github.com/libusb/libusb/archive/v1.0.23.tar.gz"
    SHA1
    c8ebcc7d0a14f910151b3066326d8ba126894b88
)

hunter_cmake_args(
	libusb
    CMAKE_ARGS
        BOOTSTRAP=./bootstrap.sh
		PKGCONFIG_EXPORT_TARGETS=libusb-1.0
)

hunter_configuration_types(libusb CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(libusb)
hunter_download(PACKAGE_NAME libusb
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    lib/pkgconfig/libusb-1.0.pc
)
