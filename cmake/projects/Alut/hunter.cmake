include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Alut
    VERSION
    1.1.0-469287b-p0
    URL
    "https://github.com/cpp-pm/freealut/archive/1.1.0-469287b-p0.tar.gz"
    SHA1
    c20f2c026bb48d9e6ade42051c998797b0b723b6
)

hunter_cmake_args(
    Alut
    CMAKE_ARGS
        BUILD_EXAMPLES=OFF
        BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Alut)
hunter_download(PACKAGE_NAME Alut)
