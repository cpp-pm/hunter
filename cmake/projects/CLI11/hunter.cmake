# Copyright (c) 2018, Pawel Bylica
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
     PACKAGE_NAME
     CLI11
     VERSION
     1.5.3
     URL
     "https://github.com/CLIUtils/CLI11/archive/v1.5.3.tar.gz"
     SHA1
     00c982a7e6819524acda111515ea02308e93a92f
 )

hunter_add_version(
     PACKAGE_NAME
     CLI11
     VERSION
     1.5.4
     URL
     "https://github.com/CLIUtils/CLI11/archive/v1.5.4.tar.gz"
     SHA1
     94c6860aaa13b16c47e939194a2cdd26e869256c
 )

hunter_add_version(
     PACKAGE_NAME
     CLI11
     VERSION
     1.6.0
     URL
     "https://github.com/CLIUtils/CLI11/archive/v1.6.0.tar.gz"
     SHA1
     f49b36ca4707dc89cb2bd03fc4f7558e30417afc
 )


hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    1.6.1
    URL
    "https://github.com/CLIUtils/CLI11/archive/v1.6.1.tar.gz"
    SHA1
    4d900c543cc73b80bc31da20998b2d516d67e0ae
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    1.6.2
    URL
    "https://github.com/CLIUtils/CLI11/archive/v1.6.2.tar.gz"
    SHA1
    a2012510cb565f17c76c1b1c0e4a7bc80fbccb33
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    1.7.0
    URL
    "https://github.com/CLIUtils/CLI11/archive/v1.7.0.tar.gz"
    SHA1
    223a3c3dff2ccbb37e9caafb3f6308fc32564060
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    1.7.1
    URL
    "https://github.com/CLIUtils/CLI11/archive/v1.7.1.tar.gz"
    SHA1
    05b6b47b58201e00db8346a9ad4df172014a4a04

)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    1.8.0
    URL
    "https://github.com/CLIUtils/CLI11/archive/v1.8.0.tar.gz"
    SHA1
    c21bdd4ca965931c9c36dadd15f74209ec1b9bca
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    1.9.0
    URL
    "https://github.com/CLIUtils/CLI11/archive/v1.9.0.tar.gz"
    SHA1
    030a307f918831b8881f90e7a2bf08b402ebd665
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    1.9.1
    URL
    "https://github.com/CLIUtils/CLI11/archive/v1.9.1.tar.gz"
    SHA1
    8c32b19a5301726f1bf0b910a91a05d4291deadc
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    2.0.0
    URL
    "https://github.com/CLIUtils/CLI11/archive/v2.0.0.tar.gz"
    SHA1
    71e706b529acbf850b060eeb095662078122b46c
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    2.1.0
    URL
    "https://github.com/CLIUtils/CLI11/archive/v2.1.0.tar.gz"
    SHA1
    2068a86c03affbf0e319a02dc24b866b1151e667
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    2.1.1
    URL
    "https://github.com/CLIUtils/CLI11/archive/v2.1.1.tar.gz"
    SHA1
    0981ee54861771ec02ea8339b39da6d6eb16166a
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    2.1.2
    URL
    "https://github.com/CLIUtils/CLI11/archive/v2.1.2.tar.gz"
    SHA1
    b8e61447d46447f178afac527bad986e171d997c
)

hunter_add_version(
    PACKAGE_NAME
    CLI11
    VERSION
    2.2.0
    URL
    "https://github.com/CLIUtils/CLI11/archive/v2.2.0.tar.gz"
    SHA1
    8ff2b5ef3436d73ce7f9db0bd94a912e305f0967
)

hunter_cmake_args(
    CLI11
    CMAKE_ARGS
    CLI11_TESTING=OFF
    CLI11_EXAMPLES=OFF
    CLI11_SINGLE_FILE=OFF
    CLI11_BUILD_DOCS=OFF
    CLI11_BUILD_TESTS=OFF
    CLI11_BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(CLI11)
hunter_download(PACKAGE_NAME CLI11)
