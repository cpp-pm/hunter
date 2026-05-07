# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.3.5-p2"
    URL
    "https://github.com/hunter-packages/glog/archive/v0.3.5-p2.tar.gz"
    SHA1
    3e95e5bcfb5c9d20c3391b72f831a285a3fc238f
)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.3.5-p1"
    URL
    "https://github.com/hunter-packages/glog/archive/v0.3.5-p1.tar.gz"
    SHA1
    64a9da4feec196071fa7f9cd2963e9f193213a67
)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.3.5-p0"
    URL
    "https://github.com/hunter-packages/glog/archive/v0.3.5-p0.tar.gz"
    SHA1
    7b1137b2fb26115f1325534a7c3ffdd6014ccbf8
)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.3.4-p2"
    URL
    "https://github.com/hunter-packages/glog/archive/v0.3.4-p2.tar.gz"
    SHA1
    61e308854b397e68435994818fefb0ff6e1bbccb
)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.3.4-p1"
    URL
    "https://github.com/hunter-packages/glog/archive/v0.3.4-p1.tar.gz"
    SHA1
    512b8ad6d9aae9499cca2e4c4530b9386cb05440
)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.4.0"
    URL
    "https://github.com/google/glog/archive/v0.4.0.tar.gz"
    SHA1
    0d79fb524591dee0f46213e9a23f609f74e0cbb2
)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.5.0"
    URL
    "https://github.com/google/glog/archive/v0.5.0.tar.gz"
    SHA1
    d4c64e1b2de9cfc52970532b301106ed94e94991
)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.6.0"
    URL
    "https://github.com/google/glog/archive/refs/tags/v0.6.0.tar.gz"
    SHA1
    31376c7916aee2fc6375994468744123ad6179b9
)

hunter_add_version(
    PACKAGE_NAME
    glog
    VERSION
    "0.7.1"
    URL
    "https://github.com/google/glog/archive/refs/tags/v0.7.1.tar.gz"
    SHA1
    470e77edcaad491d2f676987ac5a2e739978dda5
)

if(HUNTER_glog_VERSION VERSION_GREATER_EQUAL 0.7.1)
    set(_hunter_glog_with_unwind_off_flag "none")
else()
    set(_hunter_glog_with_unwind_off_flag "OFF")
endif()
if(HUNTER_glog_VERSION VERSION_LESS 0.7.1)
    # CMake 4.0+ compatibility with older Glog packages
    set(_hunter_glog_cmake_compatibility_flag "CMAKE_POLICY_VERSION_MINIMUM=3.5")
else()
    set(_hunter_glog_cmake_compatibility_flag "")
endif()
# explicitly remove dependency on gflags (only needed for tests)
hunter_cmake_args(glog CMAKE_ARGS
    WITH_GFLAGS=OFF
    WITH_UNWIND=${_hunter_glog_with_unwind_off_flag} # since 0.5.0
    WITH_GTEST=OFF # since 0.6.0
    BUILD_TESTING=OFF
    ${_hunter_glog_cmake_compatibility_flag}
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(glog)
hunter_download(PACKAGE_NAME glog)
