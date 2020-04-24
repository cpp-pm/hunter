# Copyright (c) 2019, Rahul Sheth
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Vulkan-Headers
    VERSION
    1.1.127-p0
    URL
    "https://github.com/cpp-pm/Vulkan-Headers/archive/v1.1.127-p0.tar.gz"
    SHA1
    6dc8553af090daafa19ccb823d6e137ec89df4bd
)
hunter_add_version(
    PACKAGE_NAME
    Vulkan-Headers
    VERSION
    1.2.133-p0
    URL
    "https://github.com/cpp-pm/Vulkan-Headers/archive/v1.2.133-p0.tar.gz"
    SHA1
    435cc47891936db6d2f8f7fc31ae690363e2ef0f
)

hunter_cmake_args(
    Vulkan-Headers
    CMAKE_ARGS
      VULKAN_HEADERS_SKIP_INSTALL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Vulkan-Headers)
hunter_download(PACKAGE_NAME Vulkan-Headers)
