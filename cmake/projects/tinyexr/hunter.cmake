# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tinyexr
    VERSION
    1.0.0-297e645-p0
    URL
    "https://github.com/cpp-pm/tinyexr/archive/v1.0.0-297e645-p0.tar.gz"
    SHA1
    7d17e84ddd7ba48b11ab27104bcb92222bb2ef9f
)

hunter_add_version(
    PACKAGE_NAME
    tinyexr
    VERSION
    1.0.0-297e645-p1
    URL
    "https://github.com/cpp-pm/tinyexr/archive/v1.0.0-297e645-p1.tar.gz"
    SHA1
    d977a698aadc7f48a9e6f7b1a798ae58ef85428a
)

hunter_add_version(
    PACKAGE_NAME
    tinyexr
    VERSION
    1.0.0-3c33352-p0
    URL
    "https://github.com/cpp-pm/tinyexr/archive/d9ca811d2c3b9b9aaf6752b880aa43dd59f0350e.tar.gz"
    SHA1
    e0c64e31006de21da4464f8c062fac6048a5aa2a
)

hunter_add_version(
    PACKAGE_NAME
    tinyexr
    VERSION
    1.0.0-3c33352-p1
    URL
    "https://github.com/cpp-pm/tinyexr/archive/refs/tags/v1.0.0-3c33352-p1.tar.gz"
    SHA1
    798e6ef3697b1ecc158bd43dbf66e9c93a0a945e
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tinyexr)
hunter_download(PACKAGE_NAME tinyexr)
