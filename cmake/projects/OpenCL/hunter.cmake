# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    OpenCL
    VERSION
    "2022.01.04-p1"
    URL
    "https://github.com/cpp-pm/OpenCL-ICD-Loader/archive/refs/tags/v2022.01.04-p1.tar.gz"
    SHA1
    45601ca796928f1c8b1eb66e436431d942a9a59d
)

hunter_add_version(
    PACKAGE_NAME
    OpenCL
    VERSION
    "2022.01.04-p0"
    URL
    "https://github.com/cpp-pm/OpenCL-ICD-Loader/archive/refs/tags/v2022.01.04-p0.tar.gz"
    SHA1
    82337aaaf89dcc0961f5db62dc11deba5e515980
)

hunter_add_version(
    PACKAGE_NAME
    OpenCL
    VERSION
    "2.1-p3"
    URL
    "https://github.com/hunter-packages/OpenCL-ICD-Loader/archive/2.1-p3.tar.gz"
    SHA1
    be6a6c575088103f1b87c5202dc0f69e49b3764f
)

hunter_add_version(
    PACKAGE_NAME
    OpenCL
    VERSION
    "2.1-p0"
    URL
    "https://github.com/hunter-packages/OpenCL-ICD-Loader/archive/2.1-p0.tar.gz"
    SHA1
    1cb4fed5bc4d0e1583c07e02f43daccab12eb99a
)


hunter_cmake_args(
    OpenCL
    CMAKE_ARGS
        OPENCL_TESTS=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenCL)
hunter_download(PACKAGE_NAME OpenCL)
