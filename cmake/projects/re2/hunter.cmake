# Copyright (c) 2016-2020, Ruslan Baratov, David Hirvonen, Rahul Sheth
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2017.11.01-p0
    URL
    https://github.com/hunter-packages/re2/archive/2017.11.01-p0.tar.gz
    SHA1
    78ed8b27fe1499a30281f3763bb282ea47636b1a
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2020.08.01
    URL
    https://github.com/google/re2/archive/2020-08-01.tar.gz
    SHA1
    ac4796e631461c27cd05629097a6931c1d5b13a4
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2020.10.01
    URL
    https://github.com/google/re2/archive/2020-10-01.tar.gz
    SHA1
    64379e5e59ee2bd9930462fc49196ace7de80558
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2020.11.01
    URL
    https://github.com/google/re2/archive/2020-11-01.tar.gz
    SHA1
    9da195449f7a7d3ac98c7d1078b9eb93dd256b63
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2021.02.01
    URL
    https://github.com/google/re2/archive/2021-02-01.tar.gz
    SHA1
    69c24463d2437515f27c857641bfaf49306fabac
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2021.02.02
    URL
    https://github.com/google/re2/archive/2021-02-02.tar.gz
    SHA1
    08c9b13951d6ac7ab0507c80a1f3a49aa679b4c9
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2021.04.01
    URL
    https://github.com/google/re2/archive/2021-04-01.tar.gz
    SHA1
    6eab56a3b4939778390539afe59f0c56235fdce1
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2021.06.01
    URL
    https://github.com/google/re2/archive/2021-06-01.tar.gz
    SHA1
    dee2d1de6196d72d424768a9f01d40378d0b584f
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2021.08.01
    URL
    https://github.com/google/re2/archive/2021-08-01.tar.gz
    SHA1
    c9dc2fd86d1ae2f4abce8dfe0b5544b2928ae9db
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2021.09.01
    URL
    https://github.com/google/re2/archive/2021-09-01.tar.gz
    SHA1
    838ac1688de7b8e59eb5582b6be6a470bab64b54
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2021.11.01
    URL
    https://github.com/google/re2/archive/2021-11-01.tar.gz
    SHA1
    4c18662f103ef53f106f8f98d7b46b723615e14f
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2022.02.01
    URL
    https://github.com/google/re2/archive/2022-02-01.tar.gz
    SHA1
    79bbfeaaa88426794f2386216f4b7944a9da44ee
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2022.04.01
    URL
    https://github.com/google/re2/archive/2022-04-01.tar.gz
    SHA1
    e88e72adc5dd18d00922a9c7ddf6e056e29a3d06
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2022.06.01
    URL
    https://github.com/google/re2/archive/2022-06-01.tar.gz
    SHA1
    547c9a5bbb4133bed1aae47037bba1bdade6ec9d
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2022.12.01
    URL
    https://github.com/google/re2/archive/2022-12-01.tar.gz
    SHA1
    8146fb81e2b8988a455f2f7291c7a8a4001e55a6
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2023.02.01
    URL
    https://github.com/google/re2/archive/2023-02-01.tar.gz
    SHA1
    f3533ed1afd1634cc3acd83ab2fa2c30c6cc751e
)

hunter_add_version(
    PACKAGE_NAME
    re2
    VERSION
    2023.03.01
    URL
    https://github.com/google/re2/archive/2023-03-01.tar.gz
    SHA1
    3e37cc282ad4ea05e2971e0ed28ef5dba0129651
)

hunter_cmake_args(
    re2
    CMAKE_ARGS
      RE2_BUILD_TESTING=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(re2)
hunter_download(PACKAGE_NAME re2)
