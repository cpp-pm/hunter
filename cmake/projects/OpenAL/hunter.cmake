# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_cmake_args)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME OpenAL
    VERSION "1.19.1"
    URL "https://github.com/kcat/openal-soft/archive/openal-soft-1.19.1.tar.gz"
    SHA1 "436ee636215555a351ac2ec3ea06611ad63d4bc7")

hunter_add_version(
    PACKAGE_NAME OpenAL
    VERSION "1.18.2"
    URL "https://github.com/kcat/openal-soft/archive/openal-soft-1.18.2.tar.gz"
    SHA1 "f819c6720c4beead7653ebc35fbb2c287a8970fc")

set(_hunter_openal_cmake_args)
if(NOT BUILD_SHARED_LIBS)
    set(
        _hunter_openal_cmake_args
        LIBTYPE=STATIC
    )
endif()

hunter_cmake_args(
    OpenAL
    CMAKE_ARGS
        ALSOFT_UTILS=OFF
        ALSOFT_NO_CONFIG_UTIL=ON
        ALSOFT_EXAMPLES=OFF
        ALSOFT_TESTS=OFF
        ALSOFT_CONFIG=OFF
        ALSOFT_HRTF_DEFS=OFF
        ALSOFT_AMBDEC_PRESETS=OFF
        ALSOFT_EMBED_HRTF_DATA=OFF
        ${_hunter_openal_cmake_args}
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenAL)
hunter_download(PACKAGE_NAME OpenAL)
