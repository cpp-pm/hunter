# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterSetupMsvcArch)

include(hunter_setup_msvc)

function(run_check version architecture host_toolset expected_arch expected_host expected_target expected_version expected_year)
  message("--------")
  message("Run test")

  set(MSVC_VERSION "${version}")
  set(MSVC_CXX_ARCHITECTURE_ID "${architecture}")
  set(CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE "${host_toolset}")

  message("  Input:")
  message("    MSVC_VERSION: ${MSVC_VERSION}")
  message("    MSVC_CXX_ARCHITECTURE_ID: ${MSVC_CXX_ARCHITECTURE_ID}")
  message("    CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE: ${CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE}")

  message("  Expected output:")
  message("    HUNTER_MSVC_VERSION: ${HUNTER_MSVC_VERSION}")
  message("    HUNTER_MSVC_YEAR: ${HUNTER_MSVC_YEAR}")
  message("    HUNTER_MSVC_ARCH: ${HUNTER_MSVC_ARCH}")

  set(MSVC TRUE)

  unset(HUNTER_MSVC_VCVARSALL)
  unset(HUNTER_MSVC_VCVARSALL CACHE)

  set(HUNTER_TESTING TRUE)
  hunter_setup_msvc()

  string(COMPARE EQUAL "${HUNTER_MSVC_ARCH}" "${expected_arch}" is_equal)
  if(is_equal)
    message("OK")
  else()
    message(FATAL_ERROR "Unexpected: ${HUNTER_MSVC_ARCH}")
  endif()

  string(COMPARE EQUAL "${HUNTER_MSVC_VERSION}" "${expected_version}" is_equal)
  if(is_equal)
    message("OK")
  else()
    message(FATAL_ERROR "Unexpected: ${HUNTER_MSVC_VERSION}")
  endif()

  string(COMPARE EQUAL "${HUNTER_MSVC_YEAR}" "${expected_year}" is_equal)
  if(is_equal)
    message("OK")
  else()
    message(FATAL_ERROR "Unexpected: ${HUNTER_MSVC_YEAR}")
  endif()
endfunction()

run_check("1400" "X86" "" "x86" "x86" "x86" "8" "2005")
run_check("1500" "X86" "" "x86" "x86" "x86" "9" "2008")
run_check("1600" "X86" "" "x86" "x86" "x86" "10" "2010")
run_check("1700" "X86" "" "x86" "x86" "x86" "11" "2012")
run_check("1800" "X86" "" "x86" "x86" "x86" "12" "2013")
run_check("1900" "X86" "" "x86" "x86" "x86" "14" "2015")
run_check("1910" "X86" "" "x86" "x86" "x86" "15" "2017")
run_check("1920" "X86" "" "x86" "x86" "x86" "16" "2019")

run_check("1400" "x64" "" "x86_amd64" "x86" "amd64" "8" "2005")
run_check("1500" "x64" "" "x86_amd64" "x86" "amd64" "9" "2008")
run_check("1600" "x64" "" "x86_amd64" "x86" "amd64" "10" "2010")
run_check("1700" "x64" "" "x86_amd64" "x86" "amd64" "11" "2012")
run_check("1800" "x64" "" "x86_amd64" "x86" "amd64" "12" "2013")
run_check("1900" "x64" "" "x86_amd64" "x86" "amd64" "14" "2015")
run_check("1910" "x64" "" "x86_amd64" "x86" "amd64" "15" "2017")
run_check("1920" "x64" "" "x86_amd64" "x86" "amd64" "16" "2019")
run_check("1920" "x64" "x64" "amd64" "amd64" "amd64" "16" "2019")

run_check("1400" "ARMV7" "" "x86_arm" "x86" "arm" "8" "2005")
run_check("1500" "ARMV7" "" "x86_arm" "x86" "arm" "9" "2008")
run_check("1600" "ARMV7" "" "x86_arm" "x86" "arm" "10" "2010")
run_check("1700" "ARMV7" "" "x86_arm" "x86" "arm" "11" "2012")
run_check("1800" "ARMV7" "" "x86_arm" "x86" "arm" "12" "2013")
run_check("1900" "ARMV7" "" "x86_arm" "x86" "arm" "14" "2015")
run_check("1910" "ARMV7" "" "x86_arm" "x86" "arm" "15" "2017")
run_check("1920" "ARMV7" "" "x86_arm" "x86" "arm" "16" "2019")
run_check("1920" "ARMV7" "x64" "amd64_arm" "amd64" "arm" "16" "2019")

run_check("1910" "ARM64" "" "x86_arm64" "x86" "arm64" "15" "2017")
run_check("1920" "ARM64" "" "x86_arm64" "x86" "arm64" "16" "2019")
run_check("1920" "ARM64" "x64" "amd64_arm64" "amd64" "arm64" "16" "2019")
