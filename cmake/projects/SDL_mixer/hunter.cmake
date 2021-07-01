# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_add_version(
        PACKAGE_NAME
        SDL_mixer
        VERSION
        "2.0.4-p0"
        URL
        "https://github.com/cpp-pm/SDL_mixer/archive/v2.0.4-p0.tar.gz"
        SHA1
        9c7758b4d40c846fa4de8accb0715bd1dd8cb295
)

hunter_add_version(
        PACKAGE_NAME
        SDL_mixer
        VERSION
        "2.0.1-p1"
        URL
        "https://github.com/cpp-pm/SDL_mixer_legacy/archive/v2.0.1-p1.tar.gz"
        SHA1
        dfd76b131f51e97054b48d2e803256618d6e1f21
)

hunter_add_version(
        PACKAGE_NAME
        SDL_mixer
        VERSION
        "2.0.2-p0"
        URL
        "https://github.com/cpp-pm/SDL_mixer_legacy/archive/v2.0.2-p0.tar.gz"
        SHA1
        0f6e566ec3e1fb02c35d74ac811ea24072e40424
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL_mixer)
hunter_download(PACKAGE_NAME SDL_mixer)
