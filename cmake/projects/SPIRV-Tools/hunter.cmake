# Copyright (c) 2019, Mathieu-Andre Chiasson
# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    SPIRV-Tools
    VERSION
    2019.4-p0
    URL
    https://github.com/cpp-pm/SPIRV-Tools/archive/v2019.4-p0.tar.gz
    SHA1
    c6ea3b64476403c613e138beb12b6c5f96c0c8a6
)

hunter_add_version(
    PACKAGE_NAME
    SPIRV-Tools
    VERSION
    2020.1-p0
    URL 
    https://github.com/cpp-pm/SPIRV-Tools/archive/v2020.1-p0.tar.gz
    SHA1 
    695e9abf892fe939fbe61398a06b6f177cd43e77
)

hunter_add_version(
    PACKAGE_NAME
    SPIRV-Tools
    VERSION
    2020.4-p0
    URL 
    https://github.com/cpp-pm/SPIRV-Tools/archive/v2020.4-p0.tar.gz
    SHA1 
    e408dd86040ba66dbd7cdd386af96cdb11484c44
)

hunter_cmake_args(
    SPIRV-Tools
    CMAKE_ARGS
      BUILD_TESTING=OFF
      SPIRV_SKIP_EXECUTABLES=ON
      SPIRV_SKIP_TESTS=ON
      SPIRV_WERROR=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SPIRV-Tools)
hunter_download(PACKAGE_NAME SPIRV-Tools)
