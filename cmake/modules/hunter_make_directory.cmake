# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

include(hunter_internal_error)
include(hunter_lock_directory)
include(hunter_assert_not_empty_string)

function(hunter_make_directory parent sha1 result)
  hunter_assert_not_empty_string("${parent}")
  hunter_assert_not_empty_string("${sha1}")
  hunter_assert_not_empty_string("${result}")

  string(SUBSTRING "${sha1}" 0 7 dir_id)

  set(dir_path "${parent}/${dir_id}")
  set(done_path "${dir_path}/DONE")
  set(sha1_path "${dir_path}/SHA1")

  if(NOT EXISTS "${done_path}")
    hunter_lock_directory("${dir_path}" "")
  endif()

  if(EXISTS "${done_path}")
    if(NOT EXISTS "${sha1_path}")
      hunter_internal_error("Not found: ${sha1_path}")
    endif()
    file(READ "${sha1_path}" sha1_value)
    string(TOLOWER "${sha1_value}" sha1_value_lower)
    string(TOLOWER "${sha1}" sha1_lower)
    string(COMPARE EQUAL "${sha1_value_lower}" "${sha1_lower}" is_equal)
    if(NOT is_equal)
      hunter_internal_error(
          "Short SHA1 collision:"
          "  ${sha1_value} (from ${sha1_path})"
          "  ${sha1}"
      )
    endif()
    set("${result}" "${dir_path}" PARENT_SCOPE)
    return()
  endif()

  file(MAKE_DIRECTORY "${dir_path}")
  file(WRITE "${done_path}" "")
  file(WRITE "${sha1_path}" "${sha1}")

  set("${result}" "${dir_path}" PARENT_SCOPE)
endfunction()
