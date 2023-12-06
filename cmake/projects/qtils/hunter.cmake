include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME qtils
    VERSION 0.0.1
    URL  https://github.com/qdrvm/qtils/archive/refs/tags/v0.0.1.zip
    SHA1 d65d41ea8e227fc9a93357850415aaefc71aca46
)

hunter_add_version(
    PACKAGE_NAME qtils
    VERSION 0.0.2
    URL  https://github.com/qdrvm/qtils/archive/refs/tags/v0.0.2.zip
    SHA1 cf06ed101bcfccc87a2c1fae8d0dab7d76ee0f41
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cacheable(qtils)
hunter_download(PACKAGE_NAME qtils)
