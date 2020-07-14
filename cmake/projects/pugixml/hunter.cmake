# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME pugixml
    VERSION "1.10-p0"
    URL "https://github.com/cpp-pm/pugixml/archive/v1.10-p0.tar.gz"
    SHA1 a007db95cbb6b49cb8d2d247e60a82912c435484
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(pugixml)
hunter_download(PACKAGE_NAME pugixml)
