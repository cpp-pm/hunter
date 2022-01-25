# !!! DO NOT PLACE HEADER GUARDS HERE !!!


include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SDL_ttf
    VERSION
    "2.0.15-p0"
    URL
    "https://github.com/cpp-pm/SDL_ttf/archive/v2.0.15-p0.tar.gz"
    SHA1
    a3342fac71e73f140da6bffc5a30c67ba9cfb826
)

hunter_add_version(
    PACKAGE_NAME
    SDL_ttf
    VERSION
    "2.0.14-p0"
    URL
    "https://github.com/cpp-pm/SDL_ttf_legacy/archive/v2.0.14-p0.tar.gz"
    SHA1
    be9de6d9eb411e9e0910a26a13cd29d234e51906
)

hunter_add_version(
    PACKAGE_NAME
    SDL_ttf
    VERSION
    "2.0.18-p0"
    URL
    "https://github.com/cpp-pm/SDL_ttf/archive/v2.0.18-p0.tar.gz"
    SHA1
    051ef15f3037002bd26414af56529e3bbb89a044
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL_ttf)
hunter_download(PACKAGE_NAME SDL_ttf)
