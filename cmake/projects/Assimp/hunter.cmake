# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Assimp
    VERSION
    3.2-p1
    URL
    "https://github.com/hunter-packages/assimp/archive/v3.2-p1.tar.gz"
    SHA1
    018ce1cc19f0cf89dd5157cfbfa1c2925eab6926
)

hunter_add_version(
    PACKAGE_NAME
    Assimp
    VERSION
    3.2-p0
    URL
    "https://github.com/hunter-packages/assimp/archive/v3.2-p0.tar.gz"
    SHA1
    a3f46eb24bc48cacee9f21b1ea4f4a0e3122b847
)

hunter_add_version(
    PACKAGE_NAME
    Assimp
    VERSION
    3.2-p2
    URL
    "https://github.com/hunter-packages/assimp/archive/v3.2-p2.tar.gz"
    SHA1
    7b745fc73c28073d7bdcaa18f994c39636c27776
)

hunter_add_version(
    PACKAGE_NAME
    Assimp
    VERSION
    5.0.0-07779a7a
    URL
    "https://github.com/assimp/assimp/archive/07779a7ae1c88774a2c10adf5817ea84da81d971.zip"
    SHA1
    eb8cf84437f6cd4e8efbda5839655e1e1c347c27
)

hunter_add_version(
    PACKAGE_NAME
    Assimp
    VERSION
    5.0.1-575ce61
    URL
    "https://github.com/assimp/assimp/archive/575ce6136d4941a45c6ba894947d0e79fe032aff.tar.gz"
    SHA1
    1c25da96497aede9070c2db4479c22e9dae8567f
)

hunter_add_version(
    PACKAGE_NAME
    Assimp
    VERSION
    5.0.1-dbd99bf
    URL
    "https://github.com/assimp/assimp/archive/dbd99bf700f140090e9fc495ff1175d0e619323a.tar.gz"
    SHA1
    7181e77744e8b495b5caf08f72a990797207745c
)

hunter_add_version(
    PACKAGE_NAME
    Assimp
    VERSION
    5.0.1-cb56866
    URL
    "https://github.com/assimp/assimp/archive/cb5686653f0287ba81279f2f57a897d60daf7a40.tar.gz"
    SHA1
    9556e692907303fb5d08313810d9aaa38c72ddb8
)

hunter_add_version(
    PACKAGE_NAME
    Assimp
    VERSION
    5.2.5-9519a62
    URL
    "https://github.com/assimp/assimp/archive/9519a62dd20799c5493c638d1ef5a6f484e5faf1.tar.gz"
    SHA1
    00bcc138de35ce7ff90ca7b5f2164f5bf9ba9e6e
)

hunter_cmake_args(
    Assimp
    CMAKE_ARGS
    BUILD_SHARED_LIBS=OFF
    ASSIMP_BUILD_ASSIMP_TOOLS=OFF
    ASSIMP_BUILD_SAMPLES=OFF
    ASSIMP_BUILD_TESTS=OFF
    ASSIMP_ENABLE_BOOST_WORKAROUND=OFF
    ASSIMP_INSTALL_PDB=OFF
    ASSIMP_IGNORE_GIT_HASH=ON
    ASSIMP_HUNTER_ENABLED=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Assimp)
hunter_download(PACKAGE_NAME Assimp)
