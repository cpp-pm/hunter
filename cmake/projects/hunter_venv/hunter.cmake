# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    hunter_venv
    VERSION
    1.0.1
    URL
    "https://github.com/hunter-packages/hunter_venv/archive/v1.0.1.tar.gz"
    SHA1
    e15dd948ab070960538ec6918bb4c64296174f14
)

hunter_add_version(
    PACKAGE_NAME
    hunter_venv
    VERSION
    1.0.2
    URL
    "https://github.com/cpp-pm/hunter_venv/archive/v1.0.2.tar.gz"
    SHA1
    130d66d80f162d9d5cd706a55f62fcdb9bbdbc9b
)

# DOCUMENTATION_START {
if(APPLE)
  set(__hunter_venv_default_python "3.7.5")
elseif(MSYS)
  set(__hunter_venv_default_python "3.7.5")
elseif(WIN32)
  set(__hunter_venv_default_python "3.6.8")
else()
  set(__hunter_venv_default_python "3.5.2")
endif()

hunter_cmake_args(
    hunter_venv
    CMAKE_ARGS
    HUNTER_VENV_PYTHON_VERSION=${__hunter_venv_default_python}
)
# DOCUMENTATION_END }

# No real build
hunter_configuration_types(hunter_venv CONFIGURATION_TYPES Release)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(hunter_venv)
hunter_download(PACKAGE_NAME hunter_venv)
