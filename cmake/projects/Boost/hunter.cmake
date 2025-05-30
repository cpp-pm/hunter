# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_check_toolchain_definition)

# Disable searching in locations not specified by these hint variables.
set(Boost_NO_SYSTEM_PATHS ON)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.72.0-p0"
    URL
    "https://github.com/cpp-pm/boost/archive/v1.72.0-p0.tar.gz"
    SHA1
    6022cd8eea0f04cbfb78df8064fcd134e40a7735
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.72.0-p1"
    URL
    "https://github.com/cpp-pm/boost/archive/v1.72.0-p1.tar.gz"
    SHA1
    04f570acbe0beb762e588ad3de292d0328a79c64
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.74.0-p0"
    URL
    "https://github.com/cpp-pm/boost/archive/v1.74.0-p0.tar.gz"
    SHA1
    c7ba15bb52950ac1b1912e0794ad77f66a343a17
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.75.0"
    URL
    "https://archives.boost.io/release/1.75.0/source/boost_1_75_0.tar.bz2"
    SHA1
    6109efd3bdd8b9220d7d85b5e125f7f28721b9a9
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.76.0"
    URL
    "https://archives.boost.io/release/1.76.0/source/boost_1_76_0.tar.bz2"
    SHA1
    8064156508312dde1d834fec3dca9b11006555b6
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.77.0"
    URL
    "https://archives.boost.io/release/1.77.0/source/boost_1_77_0.tar.bz2"
    SHA1
    0cb4f947d094fc311e13ffacaff00418130ef5ef
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.78.0"
    URL
    "https://archives.boost.io/release/1.78.0/source/boost_1_78_0.tar.bz2"
    SHA1
    7ccc47e82926be693810a687015ddc490b49296d
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.79.0"
    URL
    "https://archives.boost.io/release/1.79.0/source/boost_1_79_0.tar.bz2"
    SHA1
    31209dcff292bd6a64e5e08ceb3ce44a33615dc0
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.80.0"
    URL
    "https://archives.boost.io/release/1.80.0/source/boost_1_80_0.tar.bz2"
    SHA1
    690a2a2ed6861129828984b1d52a473d2c8393d1
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.81.0"
    URL
    "https://archives.boost.io/release/1.81.0/source/boost_1_81_0.tar.bz2"
    SHA1
    898469f1ae407f5cbfca84f63ad602962eebf4cc
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.82.0"
    URL
    "https://archives.boost.io/release/1.82.0/source/boost_1_82_0.tar.bz2"
    SHA1
    5c0736ce8d6f0d21275a1d9407dce48e6decce6a
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.83.0"
    URL
    "https://archives.boost.io/release/1.83.0/source/boost_1_83_0.tar.bz2"
    SHA1
    75b1f569134401d178ad2aaf97a2993898dd7ee3
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.84.0"
    URL
    "https://archives.boost.io/release/1.84.0/source/boost_1_84_0.tar.bz2"
    SHA1
    734dcfb452380a4d6304060dc2ed983668dd290f
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.85.0"
    URL
    "https://archives.boost.io/release/1.85.0/source/boost_1_85_0.tar.bz2"
    SHA1
    ed58c632befe0d299b39f9e23de1fc20d03870d7
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.86.0"
    URL
    "https://archives.boost.io/release/1.86.0/source/boost_1_86_0.tar.bz2"
    SHA1
    fd0d26a7d5eadf454896942124544120e3b7a38f
)

if(MSVC)
  hunter_check_toolchain_definition(NAME "_DLL" DEFINED _hunter_vs_md)
  hunter_cmake_args(
    Boost
    CMAKE_ARGS
      BOOST_BUILD_DYNAMIC_VSRUNTIME=${_hunter_vs_md}
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_boost)
hunter_cacheable(Boost)
hunter_download(PACKAGE_NAME Boost PACKAGE_INTERNAL_DEPS_ID "51")

# This settings Boost_USE_STATIC_LIBS and Boost_USE_STATIC_RUNTIME are needed to configure via find_package(Boost ....) for BoostConfig from boost
if(NOT HUNTER_Boost_VERSION VERSION_LESS 1.72.0)
    hunter_get_cmake_args(PACKAGE Boost OUT boost_cmake_args)
    string(FIND "${boost_cmake_args}" "BUILD_SHARED_LIBS=ON" boost_shared)
    string(FIND "${boost_cmake_args}" "BOOST_BUILD_DYNAMIC_VSRUNTIME=NO" boost_static_runtime)
    if(boost_shared LESS 0)
        option(Boost_USE_STATIC_LIBS "Use of the static libraries" ON)
    else()
        option(Boost_USE_STATIC_LIBS "Use of the static libraries" OFF)
    endif()

    if(MSVC)
        if(boost_static_runtime LESS 0)
            option(Boost_USE_STATIC_RUNTIME "Use libraries linked statically to the C++ runtime" OFF)
        else()
            option(Boost_USE_STATIC_RUNTIME "Use libraries linked statically to the C++ runtime" ON)
        endif()
    endif()
endif()
