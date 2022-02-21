include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    FLAC
    VERSION
    1.3.3-p0
    URL
    "https://github.com/cpp-pm/flac/archive/1.3.3-p0.tar.gz"
    SHA1
    712ff57b046ed00ebc2898989290c148cfda5c36
)

hunter_add_version(
    PACKAGE_NAME
    FLAC
    VERSION
    1.3.4-p0
    URL
    "https://github.com/cpp-pm/flac/archive/v1.3.4-p0.tar.gz"
    SHA1
    ec51d29efd8fc29a873c50c0185ff733f532a656
)

set(_hunter_flac_cmake_args)
if(ANDROID OR IOS)
    set(
        _hunter_flac_cmake_args
        WITH_ASM=OFF
    )
endif()

hunter_cmake_args(
    FLAC
    CMAKE_ARGS
        WITH_OGG=OFF
        BUILD_PROGRAMS=OFF
        BUILD_EXECUTABLES=OFF
        BUILD_EXAMPLES=OFF
        BUILD_DOCS=OFF
        BUILD_TESTING=OFF
        BUILD_DOXYGEN=OFF
        INSTALL_MANPAGES=OFF
        INSTALL_PKGCONFIG_MODULES=OFF
        ${_hunter_flac_cmake_args}
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(FLAC)
hunter_download(PACKAGE_NAME FLAC)
