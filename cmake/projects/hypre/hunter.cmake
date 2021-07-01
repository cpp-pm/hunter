# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_source_subdir)

hunter_add_version(
    PACKAGE_NAME
    hypre
    VERSION
    2.22.0
    URL
    "https://github.com/hypre-space/hypre/archive/v2.22.0.tar.gz"
    SHA1
    86218c9cb0c6ea4329ac4ce1924b753ed62d53dd
)

hunter_cmake_args(
    hypre
    CMAKE_ARGS
        HYPRE_WITH_MPI=OFF
)

hunter_source_subdir(
    hypre
    SOURCE_SUBDIR "src"
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(hypre)
hunter_download(PACKAGE_NAME hypre)
