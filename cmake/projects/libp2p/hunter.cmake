# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...

hunter_add_version(
    PACKAGE_NAME
    libp2p
    VERSION
    "0.1.26"
    URL
    "https://github.com/libp2p/cpp-libp2p/archive/v0.1.26.zip"
    SHA1
    9a44a1448f2de9999a0c6ef4f8aad0d68220dd50
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libp2p)
hunter_download(PACKAGE_NAME libp2p)
