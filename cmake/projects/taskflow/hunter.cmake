# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    taskflow
    VERSION
    "3.0.0-9e50cf2"
    URL
    "https://github.com/taskflow/taskflow/archive/9e50cf2a7b33b90713c20585498369caf299bf08.tar.gz"
    SHA1
    52486301a2b0a01dfe1513a09d136bc74675a287
)

hunter_add_version(
    PACKAGE_NAME
    taskflow
    VERSION
    "3.3.0"
    URL 
    "https://github.com/taskflow/taskflow/archive/refs/tags/v3.3.0.tar.gz"
    SHA1
    "f2225a9ed221ad4e9032827a530269aa5bcf03c7"
)

hunter_cmake_args(
    taskflow
    CMAKE_ARGS
        TF_BUILD_EXAMPLES=OFF
        TF_BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(taskflow)
hunter_configuration_types(foo CONFIGURATION_TYPES Release) # Taskflow is header only
hunter_download(PACKAGE_NAME taskflow)
