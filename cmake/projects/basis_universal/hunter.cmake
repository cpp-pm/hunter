# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    basis_universal
    VERSION
    1.12-f80f8dd-p0
    URL
    "https://github.com/cpp-pm/basis_universal/archive/v1.12-f80f8dd-p0.tar.gz"
    SHA1
    36971ba52c51ba42d65c6fff6a93b52a00bfdba3
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(basis_universal)
hunter_download(PACKAGE_NAME basis_universal)
