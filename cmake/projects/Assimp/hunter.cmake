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
    5.0.1-ba11458
    URL
    "https://github.com/assimp/assimp/archive/ba1145885dbd885bfd872397263564a1c712ef59.tar.gz"
    SHA1
    9315e00def383b5eb69bd2c92f2da2aef78c7048
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
