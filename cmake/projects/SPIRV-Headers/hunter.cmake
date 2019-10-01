# Copyright (c) 2019, Mathieu-Andre Chiasson
# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SPIRV-Headers
    VERSION
    1.5.1
    URL
    https://github.com/KhronosGroup/SPIRV-Headers/archive/1.5.1.tar.gz
    SHA1
    77018bfe6cb1eceaf824e401dbd206660a25bf66
)

hunter_cmake_args(
    SPIRV-Tools
    CMAKE_ARGS
      SPIRV_HEADERS_SKIP_EXAMPLES=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SPIRV-Headers)
hunter_download(PACKAGE_NAME SPIRV-Headers)
