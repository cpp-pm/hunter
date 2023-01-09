# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

# starting with 1.12.0-p2 ceres-solver is cacheable
hunter_cacheable(ceres-solver)

# List of versions
hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "1.12.0-p2"
    URL
    "https://github.com/hunter-packages/ceres-solver/archive/v1.12.0-p2.tar.gz"
    SHA1
    04724b04aaa17fdd1feaa7d21e8a37723f78d9fc
)

hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "1.12.0-p1"
    URL
    "https://github.com/hunter-packages/ceres-solver/archive/v1.12.0-p1.tar.gz"
    SHA1
    d8676dcfe72c19d77aa099a894b94515761e8e94
)

hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "1.12.0-p0"
    URL
    "https://github.com/hunter-packages/ceres-solver/archive/v1.12.0-p0.tar.gz"
    SHA1
    c8a24d83bf4b26b99fd8fc3bed28a267e6247c85
)

hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "1.14.0-p0"
    URL
    "https://github.com/hunter-packages/ceres-solver/archive/v1.14.0-p0.tar.gz"
    SHA1
    e27d6c0720977667a7789fd7e865e7362dc58695
)
hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "1.14.0-p1"
    URL
    "https://github.com/hunter-packages/ceres-solver/archive/v1.14.0-p1.tar.gz"
    SHA1
    fb63a3f1ee8c39a6eda1c3e1611aeb3789015fdf
)

hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "2.0.0-p0"
    URL
    "https://github.com/cpp-pm/ceres-solver/archive/v2.0.0-p0.tar.gz"
    SHA1
    868f7b45b127d4eb2777ce889e0d273bd11f5f73
)

hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "2.1.0-p0"
    URL
    "https://github.com/cpp-pm/ceres-solver/archive/refs/tags/v2.1.0-p0.tar.gz"
    SHA1
    315d16137f08ed4b4ee303d505a6355f96b9a3aa
)

hunter_add_version(
    PACKAGE_NAME
    ceres-solver
    VERSION
    "2.1.0-p1"
    URL
    "https://github.com/cpp-pm/ceres-solver/archive/refs/tags/v2.1.0-p1.tar.gz"
    SHA1
    8b14c6f33af3ef0595094cee2e6567681a481737
)

hunter_cmake_args(ceres-solver CMAKE_ARGS
    # explicitly remove dependency on gflags (only needed for tests)
    GFLAGS=OFF
    # explicitly disable suitesparse support
    LAPACK=OFF
    SUITESPARSE=OFF
    CXSPARSE=OFF # since 1.14.0-p0
    # OpenBLAS flag, alternative to LAPACK since v2.1.0-p0
    WITH_OPENBLAS=OFF
    # don't build tests
    BUILD_TESTING=OFF
    # also don't build examples: when suitesparse is enabled the examples need Fortran libraries
    BUILD_EXAMPLES=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
hunter_download(PACKAGE_NAME ceres-solver)

