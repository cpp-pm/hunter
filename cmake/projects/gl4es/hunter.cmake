include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_cmake_args)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    gl4es
    VERSION
    1.1.2
    URL
    "https://github.com/drodin/gl4es/archive/hunter-1.1.2.zip"
    SHA1
    50d006dd4614c3fd2a14b6f47cca566856d771f2
)

set(_hunter_gl4es_cmake_args)
if(NOT BUILD_SHARED_LIBS)
    set(
        _hunter_gl4es_cmake_args
        STATICLIB=ON
    )
endif()

hunter_cmake_args(
    gl4es
    CMAKE_ARGS
        ${_hunter_gl4es_cmake_args}
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gl4es)
hunter_download(PACKAGE_NAME gl4es)
