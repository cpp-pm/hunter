# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_add_version(
        PACKAGE_NAME
        SDL_net
        VERSION
        "2.0.1-p0"
        URL
        "https://github.com/cpp-pm/SDL_net/archive/v2.0.1-p0.tar.gz"
        SHA1
        e8024bc53ab01189ede4ff159723e61afe9b53d4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL_net)
hunter_download(PACKAGE_NAME SDL_net)
