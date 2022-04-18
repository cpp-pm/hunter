# Copyright (c) 2016 Alexey Ulyanov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.11.0"
    URL
    "https://github.com/catchorg/Catch2/archive/v2.11.0.tar.gz"
    SHA1
    debe7860b3c52d362f6c177ebe0033f8d69de1a6
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.9.1"
    URL
    "https://github.com/catchorg/Catch2/archive/v2.9.1.tar.gz"
    SHA1
    caf84ac93f6b624b9583bc9712feb3fba9417c68
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.7.0"
    URL
    "https://github.com/catchorg/Catch2/archive/v2.7.0.tar.gz"
    SHA1
    6df37d5b64a71b840a6a9d8c79c3705aa8a3f56e
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.6.0"
    URL
    "https://github.com/catchorg/Catch2/archive/v2.6.0.tar.gz"
    SHA1
    e32263de5489cfaf57d1a059f1f901312b81f7d1
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.5.0"
    URL
    "https://github.com/catchorg/Catch2/archive/v2.5.0.tar.gz"
    SHA1
    55fa742c9d2b6890da7060ca8c58693e7c8929fb
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.2.2"
    URL
    "https://github.com/catchorg/Catch2/archive/v2.2.2.tar.gz"
    SHA1
    834fcbf7be9c5c06fc1253ebbfdd290fa5983d9e
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.2.1"
    URL
    "https://github.com/catchorg/Catch2/archive/v2.2.1.tar.gz"
    SHA1
    effa701a5120f191417823b60e06e0148dd589b3
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.0.1"
    URL
    "https://github.com/hunter-packages/Catch/archive/v2.0.1-p0.tar.gz"
    SHA1
    fbfa84ce24b33386f80fe34bc855455de8b8e45e
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "1.8.2-p0"
    URL
    "https://github.com/hunter-packages/Catch/archive/v1.8.2-p0-hunter.tar.gz"
    SHA1
    d8de13879e7be959d95a8e4a0daa2d5eb5fef807
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "1.5.9"
    URL
    "https://github.com/hunter-packages/Catch/releases/download/v1.5.9-hunter/v1.5.9-hunter.tar.gz"
    SHA1
    737cb1c98fedccceb95e7bfd385e5dea0ad5d047
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.11.3"
    URL
    "https://github.com/catchorg/Catch2/archive/refs/tags/v2.11.3.tar.gz"
    SHA1
    ba08fc5a436108b4520d791f5e4d3346a284669a
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.12.4"
    URL
    "https://github.com/catchorg/Catch2/archive/refs/tags/v2.12.4.tar.gz"
    SHA1
    f889fccf14709fc473b69e48f9b60016caf7c7ee
)

hunter_add_version(
    PACKAGE_NAME
    Catch
    VERSION
    "2.13.9"
    URL
    "https://github.com/catchorg/Catch2/archive/refs/tags/v2.13.9.tar.gz"
    SHA1
    dcdb80e8215451fb99c8a24ca375274f2bd5f233
)

hunter_cmake_args(
  Catch
  CMAKE_ARGS
  NO_SELFTEST=TRUE CATCH_BUILD_TESTING=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Catch)
hunter_download(PACKAGE_NAME Catch)
