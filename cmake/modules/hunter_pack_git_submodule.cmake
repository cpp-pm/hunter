include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_user_error)

function(hunter_pack_git_submodule)
  set(optional "")
  set(one PACKAGE GIT_SUBMODULE SUBMODULE_SOURCE_SUBDIR URL_OUT SHA1_OUT)
  set(multiple "")

  # This function uses the following variable name convention.
  #
  # Suppose we have a super project with it's CMakeLists.txt
  # in /some/repository/CMakeLists.txt and a git submodule
  # in a subdirectory subdir:
  #
  # /some/repository/subdir/submodule  <-- submodule_root
  # ^^^^^^^^^^^^^^^^^^^^^^^            <-- submodule_directory
  # ^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^
  #         /                  \
  #     toplevel             sm_path
  #
  # submodule_root: the full path of the submodule repositories working directory.
  # submodule_directory: the basedir of submodule_root (one directory name stripped).
  # toplevel: the full path of the direct super project containing the submodule.
  # sm_path: the relative path of the submodule, relative to the direct super project.
  #
  # Both, toplevel and sm_path have the same meaning here
  # as in (the documentation of) git submodule foreach.

  # Introduce:
  # * x_PACKAGE
  # * x_GIT_SUBMODULE
  # * x_SUBMODULE_SOURCE_SUBDIR
  # * x_URL_OUT
  # * x_SHA1_OUT
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_GIT_SUBMODULE}")
  hunter_assert_not_empty_string("${x_URL_OUT}")
  hunter_assert_not_empty_string("${x_SHA1_OUT}")

  hunter_get_git_executable(git_executable)

  set(submodule_root "${PROJECT_SOURCE_DIR}/${x_GIT_SUBMODULE}")
  if(NOT EXISTS "${submodule_root}")
    hunter_user_error(
      "Requested GIT_SUBMODULE \"${submodule_root}\" does not exist."
      "Please check the contents of your config.cmake (run with -DHUNTER_STATUS_DEBUG:BOOL=ON to see which config is being loaded)."
    )
  endif()
  get_filename_component(submodule_directory "${submodule_root}" DIRECTORY)
  set(cmd "${git_executable}" rev-parse --show-toplevel)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_directory}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(toplevel "${output}")

  hunter_status_debug(
      "Requesting GIT_SUBMODULE \"${x_GIT_SUBMODULE}\"; toplevel: \"${toplevel}\"."
  )

  file(RELATIVE_PATH sm_path "${toplevel}" "${submodule_root}")
  set(cmd "${git_executable}" submodule status "${sm_path}")
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${toplevel}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    string(REPLACE ";" " " cmd "${cmd}")
    hunter_internal_error(
        "Command failed: '${cmd}' (${result}, ${output}, ${error})"
        "To reproduce error go to '${toplevel}' and"
        "run command '${cmd}'"
    )
  endif()

  set(submodule_file "${toplevel}/.gitmodules")
  if(NOT EXISTS "${submodule_file}")
    hunter_internal_error("File not found: '${submodule_file}'")
  endif()
  set_property(
      DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${submodule_file}"
  )

  if(NOT EXISTS "${submodule_root}")
    hunter_internal_error("Directory not exist: '${submodule_root}'")
  endif()

  set(cmd "${git_executable}" status --porcelain)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_root}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  if(NOT "${output}" STREQUAL "")
    hunter_user_error(
        "Git directory '${submodule_root}' is dirty."
        "Please commit or stash changes."
    )
  endif()

  set(cmd "${git_executable}" rev-parse --git-path HEAD)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_root}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(head_file "${output}")
  if(NOT EXISTS "${head_file}")
    hunter_internal_error("File not found: '${head_file}'")
  endif()
  set_property(
      DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${head_file}"
  )

  set(cmd "${git_executable}" rev-parse --symbolic-full-name HEAD)
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_root}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL 0)
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(head_ref "${output}")
  set(cmd "${git_executable}" rev-parse --git-path "${head_ref}")
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_root}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  set(ref_file "${output}")
  if(NOT EXISTS "${ref_file}")
    hunter_internal_error("File not found: ${ref_file}")
  endif()

  set_property(
      DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${ref_file}"
  )

  set(
      archives_directory
      "${CMAKE_CURRENT_BINARY_DIR}/_3rdParty/Hunter/git-archives"
  )

  file(MAKE_DIRECTORY "${archives_directory}")

  set(archive "${archives_directory}/${x_PACKAGE}.tar")
  hunter_status_debug("Creating archive '${archive}'")

  # check if whole submodule or just a subfolder is to be archived
  if("${x_SUBMODULE_SOURCE_SUBDIR}" STREQUAL "")
    hunter_status_debug(
        "No SUBMODULE_SOURCE_SUBDIR specified, archive whole submodule"
    )
    set(source_flag)
  else()
    hunter_status_debug(
        "SUBMODULE_SOURCE_SUBDIR specified, only archive subfolder:"
        " * ${x_SUBMODULE_SOURCE_SUBDIR}"
    )
    set(source_flag "/${x_SUBMODULE_SOURCE_SUBDIR}")
  endif()

  set(cmd "${git_executable}" archive HEAD -o "${archive}")
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${submodule_root}${source_flag}"
      RESULT_VARIABLE result
      OUTPUT_VARIABLE output
      ERROR_VARIABLE error
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
  )

  if(NOT result EQUAL "0")
    hunter_internal_error(
        "Command failed: ${cmd} (${result}, ${output}, ${error})"
    )
  endif()

  file(SHA1 "${archive}" package_sha1)
  set(package_url "file://${archive}")

  set("${x_URL_OUT}" "${package_url}" PARENT_SCOPE)
  set("${x_SHA1_OUT}" "${package_sha1}" PARENT_SCOPE)
endfunction()
