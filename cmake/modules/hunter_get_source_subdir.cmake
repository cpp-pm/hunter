# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

function(hunter_get_source_subdir)
  set(optional "")
  set(one PACKAGE OUT)
  set(multiple "")

  # Introduce:
  # * x_PACKAGE
  # * x_OUT
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_OUT}")

  set(default_args "${__HUNTER_DEFAULT_SOURCE_SUBDIR_${x_PACKAGE}}")
  set(user_args "${__HUNTER_FINAL_SOURCE_SUBDIR_${x_PACKAGE}}")

  set(source_subdir "")

  # Lowest priority: SOURCE_SUBDIR from 'hunter.cmake'
  if(NOT default_args STREQUAL "")
    hunter_status_debug(
        "Package '${x_PACKAGE}' default arguments: '${default_args}'"
    )
    set(source_subdir "${default_args}")
  endif()

  # Highest priority: SOURCE_SUBDIR from user's 'config.cmake'
  if(NOT user_args STREQUAL "")
    hunter_status_debug(
        "Package '${x_PACKAGE}' user arguments: '${user_args}'"
    )
    set(source_subdir "${user_args}")
  endif()

  set("${x_OUT}" "${source_subdir}" PARENT_SCOPE)
endfunction()
