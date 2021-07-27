include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    opusfile
    VERSION
    0.12-p1
    URL
    "https://github.com/cpp-pm/opusfile/archive/v0.12-p1.tar.gz"
    SHA1
    32d654a0cb6135022b81a25ee4aedc7ecaae3930
)

hunter_add_version(
    PACKAGE_NAME
    opusfile
    VERSION
    0.12-p0
    URL
    "https://github.com/cpp-pm/opusfile/archive/v0.12-p0.tar.gz"
    SHA1
    877447616c34b6dd7753ee1a883c713ca2f56773
)

hunter_cmake_args(
    opusfile
    CMAKE_ARGS
        BUILD_OPUSURL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(opusfile)
hunter_download(PACKAGE_NAME opusfile)
