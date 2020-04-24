include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    glu
    VERSION
    9.0.1-p0
    URL
    "https://github.com/cpp-pm/glu/archive/9.0.1-p0.tar.gz"
    SHA1
    3d974e188860cbb6cb4c35449978f511b1be5411
)

if(ANDROID OR IOS)
    hunter_cmake_args(
        glu
        CMAKE_ARGS
            WITH_GL4ES=ON
    )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(glu)
hunter_download(PACKAGE_NAME glu)
