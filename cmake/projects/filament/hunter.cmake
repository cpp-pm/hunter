# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    filament
    VERSION
    1.9.8-p0
    URL
    "https://github.com/cpp-pm/filament/archive/v1.9.8-p0.tar.gz"
    SHA1
    7ef097692ea5cd68ba34dc48c73fff96b4f98b54
)

hunter_add_version(
    PACKAGE_NAME
    filament
    VERSION
    1.9.8-p1
    URL
    "https://github.com/cpp-pm/filament/archive/v1.9.8-p1.tar.gz"
    SHA1
    1f86ae7536204d12b91bef1fc7741d846955644a
)

hunter_add_version(
    PACKAGE_NAME
    filament
    VERSION
    1.9.9-p0
    URL
    "https://github.com/cpp-pm/filament/archive/v1.9.9-p0.tar.gz"
    SHA1
    796e87a58713cf3bd517a66a2a7722bf006f52ac
)

hunter_add_version(
    PACKAGE_NAME
    filament
    VERSION
    1.9.9-p1
    URL
    "https://github.com/cpp-pm/filament/archive/v1.9.9-p1.tar.gz"
    SHA1
    5cae823054ff29acfbdcf89cbb87239296445c81
)

hunter_cmake_args(
    filament
    CMAKE_ARGS
    FILAMENT_ENABLE_JAVA=OFF
    FILAMENT_SUPPORTS_VULKAN=OFF
    FILAMENT_BUILD_FILAMAT=OFF
    FILAMENT_SKIP_SAMPLES=ON
    FILAMENT_ENABLE_MATDBG=OFF
    USE_STATIC_LIBCXX=OFF
    USE_STATIC_CRT=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(filament)
hunter_download(PACKAGE_NAME filament)
