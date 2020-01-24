if(DEFINED HUNTER_CMAKE_PROJECTS_LIB_CPP_PRE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LIB_CPP_PRE_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.2.2"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.2.2.tar.gz" 
    SHA1 6733a0abd9f74bd67e4ef521e7677ad9437cdba1 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.3.2"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.3.2.tar.gz" 
    SHA1 fef5d597594a62f25bc4ae71608d1f0d70f24a56 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.3.3"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.3.3.tar.gz" 
    SHA1 28e5f813b255d6a2e5592d0cf80225ffaeef3f8e 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.3.5"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.3.5.tar.gz" 
    SHA1 3b32577823fd7fdbe448d13e6011672e7a8ef143 
)


hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.3.6"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.3.6.tar.gz" 
    SHA1 044fb7ef957d09ca3abca22597efef9ab61f5693
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.3.7"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.3.7.tar.gz" 
    SHA1 ad0e7ee9332d11452412a06d425a1df27ee3e79e
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.3.8"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.3.8.tar.gz" 
    SHA1 ef82e6c456ca903c11f1dca0f9f33cdb70efe61e 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.4.0"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.4.0.tar.gz" 
    SHA1 fac0e14d6111118f230cff85e23c72fccb3b07cd 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.4.1"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.4.1.tar.gz" 
    SHA1 d7dd80f6c9b939b39914194a0d6682399a793950 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.4.2"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.4.2.tar.gz" 
    SHA1 68ab8f6f58fd01680e981dc855ea83778a748872 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.4.3"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/v1.4.3.tar.gz" 
    SHA1 b4494c774b314d8c18759f53933f6d59352dc947 
)

hunter_add_version(
    PACKAGE_NAME lib-cpp-pre
    VERSION "1.4.4"
    URL "https://github.com/daminetreg/lib-cpp-pre/archive/feature/updating-deps.tar.gz" 
    SHA1 6e87e7b8eaecb5e48509c84e1782e0377b4eb87c 
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME lib-cpp-pre)
