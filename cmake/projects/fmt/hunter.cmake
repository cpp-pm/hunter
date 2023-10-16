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
    fmt
    VERSION
    "3.0.0"
    URL
    "https://github.com/fmtlib/fmt/releases/download/3.0.0/fmt-3.0.0.zip"
    SHA1
    82ca4625f977ee1e0627ce8421bc52fbbf6e5cc5
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "4.0.0"
    URL
    "https://github.com/fmtlib/fmt/archive/4.0.0.tar.gz"
    SHA1
    d52942b4a31fb94dbb2cca36c90e34209033408f
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "4.1.0"
    URL
    "https://github.com/fmtlib/fmt/archive/4.1.0.tar.gz"
    SHA1
    9df8f7a70c1b45ffe308e8e3f4f92b31cb927a7a
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "5.2.1"
    URL
    "https://github.com/fmtlib/fmt/archive/5.2.1.tar.gz"
    SHA1
    8b38f1ecdf137e8ca24e9b66145c1b94fa5f921d
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "5.3.0"
    URL
    "https://github.com/fmtlib/fmt/archive/5.3.0.tar.gz"
    SHA1
    787a568322e08cebb1e164b3c9766e27ca18b2c8
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "6.0.0"
    URL
    "https://github.com/fmtlib/fmt/archive/6.0.0.tar.gz"
    SHA1
    40635ee94d24cb9856422293c04150017a8911df
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "6.1.0"
    URL
    "https://github.com/fmtlib/fmt/archive/6.1.0.tar.gz"
    SHA1
    f013c18e649f5b93c1fe100982d46f9d6f94dbdd
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "6.1.1"
    URL
    "https://github.com/fmtlib/fmt/archive/6.1.1.tar.gz"
    SHA1
    55912c57acdd7cf10c0e614a47de0e8336a9696a
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "6.1.2"
    URL
    "https://github.com/fmtlib/fmt/archive/6.1.2.tar.gz"
    SHA1
    dc59b27d461f1af12daf73f3e00d18bf1e9eed78
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "7.1.2"
    URL
    "https://github.com/fmtlib/fmt/archive/7.1.2.tar.gz"
    SHA1
    59bea0bd88e72ac2769c57d584b0cbed956038cf
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "8.1.1"
    URL
    "https://github.com/fmtlib/fmt/archive/8.1.1.tar.gz"
    SHA1
    9577d6de8f4e268690b099976810ade9ebef5fb5
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "9.1.0"
    URL
    "https://github.com/fmtlib/fmt/archive/9.1.0.tar.gz"
    SHA1
    6c0db60f3fa7bd4cf58edc777a2408e0ddfb28b9
)

hunter_add_version(
    PACKAGE_NAME
    fmt
    VERSION
    "10.1.1"
    URL
    "https://github.com/fmtlib/fmt/archive/10.1.1.tar.gz"
    SHA1
    e94b38a9efe0d696373a3cb1300dd24f12e2dd9c
)

hunter_cmake_args(
    fmt
    CMAKE_ARGS
        FMT_DOC=OFF
        FMT_TEST=OFF
        FMT_USE_CPP14=OFF # don't force c++14
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

hunter_cacheable(fmt)
# Download package.
hunter_download(PACKAGE_NAME fmt)
