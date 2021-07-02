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
    "https://github.com/cpp-pm/tinyexr/archive/refs/tags/v1.0.0-3c33352-p0.tar.gz"
    SHA1
    9d06c3179a8e8f119c78c43eee21cb806820aea7
)

hunter_add_version(
    PACKAGE_NAME
    tinyexr
    VERSION
    1.0.0-3c33352-p1
    URL
    "https://github.com/cpp-pm/tinyexr/archive/refs/tags/v1.0.0-3c33352-p1.tar.gz"
    SHA1
    86e19cfe3c1ba71541e5bad31eaa2269f0479cfe
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tinyexr)
hunter_download(PACKAGE_NAME tinyexr)
