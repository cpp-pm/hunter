# Copyright (c) 2017, NeroBurner
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_cacheable(SuiteSparse)

# List of versions here...
## suitesparse-metis-for-windows version is 1.3.1
## suitesparse library version is 4.5.1
hunter_add_version(
    PACKAGE_NAME
    SuiteSparse
    VERSION
    "4.5.1-p1"
    URL
    "https://github.com/hunter-packages/suitesparse-metis-for-windows/archive/v1.3.1-p1.tar.gz"
    SHA1
    b5c678a7dbb88ff60e454c9f93c30b618d8451ac
)
hunter_add_version(
    PACKAGE_NAME
    SuiteSparse
    VERSION
    "4.5.1-p0"
    URL
    "https://github.com/hunter-packages/suitesparse-metis-for-windows/archive/v1.3.1-p0.tar.gz"
    SHA1
    1350eab5d1a8d488e7b28d217fa751906d4767da
)
## suitesparse-metis-for-windows version is 1.4.0
## suitesparse library version is 5.1.2
hunter_add_version(
    PACKAGE_NAME
    SuiteSparse
    VERSION
    "5.1.2-p0"
    URL
    "https://github.com/hunter-packages/suitesparse-metis-for-windows/archive/v1.4.0-p0.tar.gz"
    SHA1
    6ea701f288a51bc57f1db5918c6b0879d800ed28
)
## suitesparse-metis-for-windows version is 1.6.0
## suitesparse library version is 5.4.0
hunter_add_version(
    PACKAGE_NAME
    SuiteSparse
    VERSION
    "5.4.0"
    URL
    "https://github.com/jlblancoc/suitesparse-metis-for-windows/archive/refs/tags/v1.6.1.tar.gz"
    SHA1
    d3131ac76330981150619b05664a75ade58da947
)
## suitesparse-metis-for-windows version is 1.7.0
## suitesparse library version is 5.4.0
hunter_add_version(
    PACKAGE_NAME
    SuiteSparse
    VERSION
    "5.4.0-1"
    URL
    "https://github.com/jlblancoc/suitesparse-metis-for-windows/archive/refs/tags/v1.7.0.tar.gz"
    SHA1
    8d5f788248a8ca3558855afc556d7be4f7659c40
)

## suitesparse-metis-for-windows version is 1.8.0
## suitesparse library version is 5.4.0
hunter_add_version(
    PACKAGE_NAME
    SuiteSparse
    VERSION
    "5.4.0-2"
    URL
    "https://github.com/jlblancoc/suitesparse-metis-for-windows/archive/refs/tags/v1.8.0.tar.gz"
    SHA1
    c85cc6149dc44e7d351b5549c6e23a53ff94bc23
)

hunter_add_version(
    PACKAGE_NAME
    SuiteSparse
    VERSION
    "7.5.1-1"
    URL
    "https://github.com/jlblancoc/suitesparse-metis-for-windows/archive/refs/tags/v7.5.1-1.tar.gz"
    SHA1
    82d7c5f577694472a6ba1d7967625c043d4ab816
)

if(HUNTER_SuiteSparse_VERSION VERSION_LESS 5.4.0)
    set(_SuiteSparse_BUILD_METIS NO)
    set(_SuiteSparse_WITH_OPENBLAS NO)
else()
    # starting with tag v1.6.0 (SuiteSparse 5.4.0) build with metis support
    set(_SuiteSparse_BUILD_METIS YES)
    # and build against OpenBLAS, which starting with v0.3.21 provides a
    # f2c-converted LAPACK v3.9.0 implementation, making the build C++ only
    set(_SuiteSparse_WITH_OPENBLAS YES)
endif()
if(HUNTER_SuiteSparse_VERSION VERSION_LESS 7.5.1)
    # since 5.4.0-2, needed for compatibility with ceres-solver 2.2.0
    set(_SuiteSparse_METIS_IDXTYPEWIDTH 32)
else()
    # since SuiteSparse 7.5.1-1 metis is internal only and requires 64 bit
    set(_SuiteSparse_METIS_IDXTYPEWIDTH 64)
endif()

hunter_cmake_args(
    SuiteSparse
    CMAKE_ARGS
    BUILD_METIS=${_SuiteSparse_BUILD_METIS}
    WITH_OPENBLAS=${_SuiteSparse_WITH_OPENBLAS}
    METIS_IDXTYPEWIDTH=${_SuiteSparse_METIS_IDXTYPEWIDTH}
    HUNTER_INSTALL_LICENSE_FILES=LICENSE.md
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME SuiteSparse)
