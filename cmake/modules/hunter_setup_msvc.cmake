# Copyright (c) 2014-2016, Ruslan Baratov, Sumedh Ghaisas
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_internal_error)
include(hunter_status_debug)

# Set next variables to the current scope:
# * HUNTER_MSVC_VERSION - version of Visual Studio. Used to create VS*COMNTOOLS
#     environment variable name, e.g.:
#     Visual Studio 8 2005 -> VS80COMNTOOLS
#     Visual Studio 14 2015 -> VS140COMNTOOLS
# * HUNTER_MSVC_YEAR - year of Visual Studio. Used by 'url_sha1_qt' scheme
# * HUNTER_MSVC_ARCH - architecture specifier. Variable used to start VS
#     Command Prompt. See section "Vcvarsall.bat argument":
#     - http://msdn.microsoft.com/en-us/library/x4d2c09s.aspx
#     - http://msdn.microsoft.com/library/x4d2c09s%28v=vs.110%29.aspx
#     - https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170#vcvarsall-syntax
#     First part it host toolset, second is target platform, if they are
#       the same it is condensed to one part. Chosen based on cmake default
#       behaviour. See cmake docs:
#     - https://cmake.org/cmake/help/latest/generator/Visual%20Studio%2015%202017.html#toolset-selection
#     - https://cmake.org/cmake/help/latest/generator/Visual%20Studio%2016%202019.html#toolset-selection
#     The Hunter arch variables are always lower-case. This is done to prevent confusion.
#     The tools `vcvarsall.bat` and `cmake -A` both are case-insensitive, which makes our job easier.
#     CMake generator -> HUNTER_MSVC_ARCH example:
#       -G "Visual Studio 12 2013" -> x86
#       -G "Visual Studio 16 2019" -> x86/x64 depending on host platform
#       -G "Visual Studio 12 2013" -A x64 -> x86_amd64
#       -G "Visual Studio 12 2013" -A x64 -T "host=x64" -> amd64
#       -G "Visual Studio 15 2017" -A ARM64 -> x86_arm64
#       -G "Visual Studio 15 2017" -A ARM64 -T "host=x64" -> amd64_arm64
#       -G "Visual Studio 17 2022" -A ARM64EC -T "host=x64" -> amd64_arm64ec
#       Note: These last ones are a deprecated style from cmake < v3.1
#       -G "Visual Studio 12 2013 Win64" -> x86_amd64
#       -G "Visual Studio 12 2013 ARM" -> x86_arm
#     CMake's MSVC_CXX_ARCHITECTURE_ID:
#       X86 -> x86
#       x64 -> x86_amd64
#       x64 (with x64 toolset selected) -> amd64
#       ARMV7 -> x86_arm
#       ARM64 -> x86_arm64
# * HUNTER_MSVC_ARCH_HOST - architecture specifier for running on host
#     Used for building tools which are needed for building, e.g. Boost's
#     b2 build tool.
# * HUNTER_MSVC_ARCH_TARGET - architecture specifier for target. Cannot
#     be used directly, but can be useful for querying target architecture.
# * HUNTER_MSVC_VCVARSALL - full path to the 'vcvarsall.bat' script

# This function should work with all generators that provide MSVC compiler:
# * Visual Studio ...
# * NMake Makefiles
# * Ninja

# User can set all HUNTER_MSVC_* variables manually in toolchain to force
# custom values (checked by HUNTER_MSVC_ARCH)
macro(hunter_setup_msvc)
  if(MSVC AND NOT HUNTER_MSVC_ARCH)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1400" _vs_8_2005)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1500" _vs_9_2008)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1600" _vs_10_2010)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1700" _vs_11_2012)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1800" _vs_12_2013)
    string(COMPARE EQUAL "${MSVC_VERSION}" "1900" _vs_14_2015)
    string(REGEX MATCH "^191[0-9]$" _vs_15_2017 "${MSVC_VERSION}")
    string(REGEX MATCH "^192[0-9]$" _vs_16_2019 "${MSVC_VERSION}")
    string(REGEX MATCH "^193[0-9]$" _vs_17_2022 "${MSVC_VERSION}")

    if(_vs_8_2005)
      set(HUNTER_MSVC_VERSION "8")
      set(HUNTER_MSVC_YEAR "2005")
    elseif(_vs_9_2008)
      set(HUNTER_MSVC_VERSION "9")
      set(HUNTER_MSVC_YEAR "2008")
    elseif(_vs_10_2010)
      set(HUNTER_MSVC_VERSION "10")
      set(HUNTER_MSVC_YEAR "2010")
    elseif(_vs_11_2012)
      set(HUNTER_MSVC_VERSION "11")
      set(HUNTER_MSVC_YEAR "2012")
    elseif(_vs_12_2013)
      set(HUNTER_MSVC_VERSION "12")
      set(HUNTER_MSVC_YEAR "2013")
    elseif(_vs_14_2015)
      set(HUNTER_MSVC_VERSION "14")
      set(HUNTER_MSVC_YEAR "2015")
    elseif(_vs_15_2017)
      set(HUNTER_MSVC_VERSION "15")
      set(HUNTER_MSVC_YEAR "2017")
    elseif(_vs_16_2019)
      set(HUNTER_MSVC_VERSION "16")
      set(HUNTER_MSVC_YEAR "2019")
    elseif(_vs_17_2022)
      set(HUNTER_MSVC_VERSION "17")
      set(HUNTER_MSVC_YEAR "2022")
    else()
      hunter_internal_error("Unexpected MSVC_VERSION: '${MSVC_VERSION}'")
    endif()

    hunter_status_debug("HUNTER_MSVC_VERSION: ${HUNTER_MSVC_VERSION}")
    hunter_status_debug("HUNTER_MSVC_YEAR: ${HUNTER_MSVC_YEAR}")

    string(COMPARE EQUAL "${MSVC_CXX_ARCHITECTURE_ID}" "" _cxx_is_empty)
    string(COMPARE EQUAL "${MSVC_C_ARCHITECTURE_ID}" "" _c_is_empty)

    if(NOT _cxx_is_empty)
      set(_architecture_id "${MSVC_CXX_ARCHITECTURE_ID}")
    elseif(NOT _c_is_empty)
      set(_architecture_id "${MSVC_C_ARCHITECTURE_ID}")
    else()
      hunter_internal_error("MSVC_*_ARCHITECTURE_ID is empty")
    endif()
    # compare to lower case to be case insensitive like `vcvarsall.bat` and `cmake -A`
    string(TOLOWER "${_architecture_id}" _architecture_id)

    string(COMPARE EQUAL "${_architecture_id}" "x86" _is_x86)
    string(COMPARE EQUAL "${_architecture_id}" "x64" _is_x64)
    string(COMPARE EQUAL "${_architecture_id}" "armv7" _is_arm)
    string(COMPARE EQUAL "${_architecture_id}" "arm64" _is_arm64)
    string(COMPARE EQUAL "${_architecture_id}" "arm64ec" _is_arm64ec)

    # output lower case, to prevent confusion
    if(_is_x86)
      set(HUNTER_MSVC_ARCH_TARGET "x86")
    elseif(_is_x64)
      set(HUNTER_MSVC_ARCH_TARGET "amd64")
    elseif(_is_arm)
      set(HUNTER_MSVC_ARCH_TARGET "arm")
    elseif(_is_arm64)
      set(HUNTER_MSVC_ARCH_TARGET "arm64")
    elseif(_is_arm64ec)
      set(HUNTER_MSVC_ARCH_TARGET "arm64ec")
    else()
      hunter_internal_error(
          "Unexpected MSVC_*_ARCHITECTURE_ID: '${_architecture_id}'"
      )
    endif()

    # These strings do not match the MSVC_*_ARCHITECTURE_ID ones (empty string indicates original x86 default)
    # compare case-insensitive to maximize compatibility
    string(TOLOWER "${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}" _host_arch)
    string(COMPARE EQUAL "${_host_arch}" "" _host_is_default_x86)
    string(COMPARE EQUAL "${_host_arch}" "x86" _host_is_x86)
    string(COMPARE EQUAL "${_host_arch}" "x64" _host_is_x64)
    string(COMPARE EQUAL "${_host_arch}" "arm" _host_is_arm)
    string(COMPARE EQUAL "${_host_arch}" "arm64" _host_is_arm64)

    # output lower case, to prevent confusion
    if(_host_is_x86 OR _host_is_default_x86)
      set(HUNTER_MSVC_ARCH_HOST "x86")
    elseif(_host_is_x64)
      set(HUNTER_MSVC_ARCH_HOST "amd64")
    elseif(_host_is_arm)
      set(HUNTER_MSVC_ARCH_HOST "arm")
    elseif(_host_is_arm64)
      set(HUNTER_MSVC_ARCH_HOST "arm64")
    else()
      hunter_internal_error(
          "Unexpected CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE: '${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}'"
      )
    endif()

    if(HUNTER_MSVC_ARCH_HOST STREQUAL HUNTER_MSVC_ARCH_TARGET)
      set(HUNTER_MSVC_ARCH "${HUNTER_MSVC_ARCH_HOST}")
    else()
      set(HUNTER_MSVC_ARCH "${HUNTER_MSVC_ARCH_HOST}_${HUNTER_MSVC_ARCH_TARGET}")
    endif()

    hunter_status_debug("HUNTER_MSVC_ARCH: ${HUNTER_MSVC_ARCH}")
    hunter_status_debug("HUNTER_MSVC_ARCH_HOST: ${HUNTER_MSVC_ARCH_HOST}")
    hunter_status_debug("HUNTER_MSVC_ARCH_TARGET: ${HUNTER_MSVC_ARCH_TARGET}")

    set(_hunter_vcvarsall_env "${HUNTER_MSVC_VERSION}0")
    set(_hunter_vcvarsall_env "VS${_hunter_vcvarsall_env}COMNTOOLS")
    set(_hunter_vcvarsall_path "$ENV{${_hunter_vcvarsall_env}}")

    hunter_status_debug(
        "Environment '${_hunter_vcvarsall_env}': '${_hunter_vcvarsall_path}'"
    )
    hunter_status_debug(
        "CMAKE_VS_DEVENV_COMMAND: '${CMAKE_VS_DEVENV_COMMAND}'"
    )
    hunter_status_debug(
        "CMAKE_VS_MSBUILD_COMMAND: '${CMAKE_VS_MSBUILD_COMMAND}'"
    )

    string(COMPARE EQUAL "${_hunter_vcvarsall_path}" "" _is_empty)
    if(_is_empty)
      if(HUNTER_TESTING)
        # ignore error, see 'tests/hunter_setup_msvc/CMakeLists.txt'
      else()
        hunter_status_debug(
            "Environment variable '${_hunter_vcvarsall_env}' is empty,"
            "  analyzing CMAKE_VS_DEVENV_COMMAND and CMAKE_VS_MSBUILD_COMMAND"
        )
        string(COMPARE EQUAL "${CMAKE_VS_DEVENV_COMMAND}" "" is_devenv_empty)
        string(COMPARE EQUAL "${CMAKE_VS_MSBUILD_COMMAND}" "" is_msbuild_empty)
        if(NOT is_devenv_empty AND IS_ABSOLUTE "${CMAKE_VS_DEVENV_COMMAND}")
          get_filename_component(_hunter_vcvarsall_path
              "${CMAKE_VS_DEVENV_COMMAND}" DIRECTORY
          )
          set(_hunter_vcvarsall_path
              "${_hunter_vcvarsall_path}/../../VC/Auxiliary/Build"
          )
        elseif(NOT is_msbuild_empty AND IS_ABSOLUTE "${CMAKE_VS_MSBUILD_COMMAND}")
          get_filename_component(_hunter_vcvarsall_path
              "${CMAKE_VS_MSBUILD_COMMAND}" DIRECTORY
          )
          set(_hunter_vcvarsall_path
              "${_hunter_vcvarsall_path}/../../../VC/Auxiliary/Build"
          )
        else()
          hunter_fatal_error(
              "Incorrect MSVC setup:"
              "  At least one of the following should be an absolute path"
              "  CMAKE_VS_DEVENV_COMMAND:(${CMAKE_VS_DEVENV_COMMAND})"
              "  CMAKE_VS_MSBUILD_COMMAND:(${CMAKE_VS_MSBUILD_COMMAND})"
              ERROR_PAGE
              error.vs.devenv
          )
        endif()
      endif()
    else()
      set(_hunter_vcvarsall_path "${_hunter_vcvarsall_path}/../../VC")
      if(NOT HUNTER_MSVC_VERSION VERSION_LESS "15")
        # Visual Studio 15 2017+
        # * https://github.com/ruslo/hunter/issues/836#issue-236352343
        set(_hunter_vcvarsall_path "${_hunter_vcvarsall_path}/Auxiliary/Build")
      endif()
    endif()

    get_filename_component(
        _hunter_vcvarsall_path "${_hunter_vcvarsall_path}" ABSOLUTE
    )
    find_file(
        HUNTER_MSVC_VCVARSALL
        "vcvarsall.bat"
        PATHS
        "${_hunter_vcvarsall_path}"
        NO_DEFAULT_PATH
    )
    if(NOT HUNTER_MSVC_VCVARSALL)
      if(HUNTER_TESTING)
        # ignore error, see 'tests/hunter_setup_msvc/CMakeLists.txt'
      else()
        hunter_internal_error(
            "vcvarsall.bat not found in `${_hunter_vcvarsall_path}`"
        )
      endif()
    endif()

    hunter_status_debug("vcvarsall.bat file location: ${HUNTER_MSVC_VCVARSALL}")
  endif()
endmacro()
