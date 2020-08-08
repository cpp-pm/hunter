include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    theora
    VERSION
    1.1.1-p0
    URL
    "https://github.com/cpp-pm/theora/archive/v1.1.1-p0.tar.gz"
    SHA1
    ccccca94bb200c272a552a4ebf83327eee43245a
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(theora)
hunter_download(PACKAGE_NAME theora)
