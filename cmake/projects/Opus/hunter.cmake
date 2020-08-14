include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Opus
    VERSION
    1.3.1
    URL
    "https://github.com/xiph/opus/archive/v1.3.1.tar.gz"
    SHA1
    9d58962b734ab265ad1154e9a3fe21103b198baa
)

hunter_cmake_args(
    Opus
    CMAKE_ARGS
        OPUS_INSTALL_PKG_CONFIG_MODULE=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Opus)
hunter_download(PACKAGE_NAME Opus)
