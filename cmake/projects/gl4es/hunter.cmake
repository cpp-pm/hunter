include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_cmake_args)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    gl4es
    VERSION
    1.1.4-p0
    URL
    "https://github.com/cpp-pm/gl4es/archive/1.1.4-p0.tar.gz"
    SHA1
    fcb75a97d261bf7910a5bbfbd60a95a36a216295
)

hunter_add_version(
    PACKAGE_NAME
    gl4es
    VERSION
    1.1.2-p0
    URL
    "https://github.com/cpp-pm/gl4es/archive/1.1.2-p0.tar.gz"
    SHA1
    8dab8937c43a4c6de5e3fd474d9607175d1cebdf
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
