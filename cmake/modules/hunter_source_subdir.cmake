# Copyright (c) 2013, Ruslan Baratov
# Copyright (c) 2014, Alexander Lamaison
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)

function(hunter_source_subdir package)
  hunter_assert_not_empty_string("${package}")

  set(optional "")
  set(one SOURCE_SUBDIR)

  # Introduce:
  # * x_SOURCE_SUBDIR
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGN}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")
  hunter_assert_not_empty_string("${x_SOURCE_SUBDIR}")

  set("__HUNTER_DEFAULT_SOURCE_SUBDIR_${package}" "${x_SOURCE_SUBDIR}" PARENT_SCOPE)
endfunction()
