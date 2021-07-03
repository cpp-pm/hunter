# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_add_version(
        PACKAGE_NAME
        SDL_image
        VERSION
        "2.0.5-p0"
        URL
        "https://github.com/cpp-pm/SDL_image/archive/v2.0.5-p0.tar.gz"
        SHA1
        7c93e53ad122364bb934e90dac265d88f768a4ed
)

hunter_add_version(
        PACKAGE_NAME
        SDL_image
        VERSION
        "2.0.1-p1"
        URL
        "https://github.com/cpp-pm/SDL_image_cmake_legacy/archive/2.0.1-p1.tar.gz"
        SHA1
        a36f0617b0d22e9960ef931b43ecbcb6a9df165f
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL_image)
hunter_download(PACKAGE_NAME SDL_image)
