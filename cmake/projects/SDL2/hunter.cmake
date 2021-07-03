# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p8"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/2.0.4-p8.tar.gz"
        SHA1
        d2f9aee32e956c9cafd6e2df0c5c5d5d88157047
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p7"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/2.0.4-p7.tar.gz"
        SHA1
        234857bd25d95a134ef6594b30f9e7d7659341ee
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p6"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/2.0.4-p6.tar.gz"
        SHA1
        c9afdee8153242ee37580876bc8780872ebc0b15
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p5"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/2.0.4-p5.tar.gz"
        SHA1
        9eedf2b0fc3c145403ef634ae4ac94b59a3ec9dd
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p4"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/2.0.4-p4.tar.gz"
        SHA1
        4f46d397f5b8165c5ed228ba8108bdecc30dc17b
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p3"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/2.0.4-p3.tar.gz"
        SHA1
        74f949eecaad3769f23b9f1e8ab5de992fb735bf
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p2"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/2.0.4-p2.tar.gz"
        SHA1
        86d95409083ab0f5afbbc523bcaf06b2b23ce6ec
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-p1"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/2.0.4-p1.tar.gz"
        SHA1
        6a518349dc94464692012ccf092f48b691f82320
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.7-p1"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/v2.0.7-p1.tar.gz"
        SHA1
        17bd450a46fac5a6de43c0a68b88be02d1497f5a
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.7-p2"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/v2.0.7-p2.tar.gz"
        SHA1
        5ee9c4801c5ef41340aa6677eb640bbff7716884
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.7-p3"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/v2.0.7-p3.tar.gz"
        SHA1
        3934d2cb55929f9a0ce69d22b12a06377d966720
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.12-p0"
        URL
        "https://github.com/cpp-pm/SDL/archive/v2.0.12-p0.tar.gz"
        SHA1
        3c8b785215d415b57a708f54fcb62221f98ffc18
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-urho-p2"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/v2.0.4-urho-p2.tar.gz"
        SHA1
        1f6890d0466412fbcad4bcf938fd6b514c799e02
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-urho-p3"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/v2.0.4-urho-p3.tar.gz"
        SHA1
        86e783b9f111467fa33e8cab503b9092f720c916
)

hunter_add_version(
        PACKAGE_NAME
        SDL2
        VERSION
        "2.0.4-urho-p4"
        URL
        "https://github.com/cpp-pm/SDL2_legacy/archive/v2.0.4-urho-p4.tar.gz"
        SHA1
        5911cc0320b9418634a7e8294f0e6dbbac44e4cf
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL2)
hunter_download(PACKAGE_NAME SDL2)
