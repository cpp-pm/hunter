# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME pybind11
    VERSION "2.2.1"
    URL "https://github.com/pybind/pybind11/archive/v2.2.1.tar.gz"
    SHA1 "a2bfabe5ae736c3fc3408b5401a656c1f584b511")

hunter_add_version(
    PACKAGE_NAME pybind11
    VERSION "2.2.4"
    URL "https://github.com/pybind/pybind11/archive/v2.2.4.tar.gz"
    SHA1 "488971990bbd3828311356faaa30f4b0d7575dad")

hunter_add_version(
    PACKAGE_NAME pybind11
    VERSION "2.3.0"
    URL "https://github.com/pybind/pybind11/archive/v2.3.0.tar.gz"
    SHA1 "98b9ccfb793806f9046f94421ce360598ab42bc3")

hunter_add_version(
    PACKAGE_NAME pybind11
    VERSION "2.4.0"
    URL "https://github.com/pybind/pybind11/archive/v2.4.0.tar.gz"
    SHA1 "22c1bff0b451f2faa21374e03515276649c9d749")
    
hunter_add_version(
    PACKAGE_NAME pybind11
    VERSION "2.4.1"
    URL "https://github.com/pybind/pybind11/archive/v2.4.1.tar.gz"
    SHA1 "41903d9fad671ae62218e1d87e2ce6cd508f7c8a")

hunter_add_version(
    PACKAGE_NAME pybind11
    VERSION "2.4.2"
    URL "https://github.com/pybind/pybind11/archive/v2.4.2.tar.gz"
    SHA1 "b9ea5cb8bdf96f9765914036dcbfe266c240eb6a")

hunter_add_version(
    PACKAGE_NAME pybind11
    VERSION "2.4.3"
    URL "https://github.com/pybind/pybind11/archive/v2.4.3.tar.gz"
    SHA1 "75d0184c1720bad96bbcbef0e25ccee92f21523b")

hunter_add_version(
    PACKAGE_NAME pybind11
    VERSION "2.5.0"
    URL "https://github.com/pybind/pybind11/archive/v2.5.0.tar.gz"
    SHA1 "8caf0bde85813f9eac55e516d4afcb925806aa5e")
    
hunter_cmake_args(pybind11 CMAKE_ARGS PYBIND11_TEST=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(pybind11)
hunter_download(PACKAGE_NAME pybind11)
