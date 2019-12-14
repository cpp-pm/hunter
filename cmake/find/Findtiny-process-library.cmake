# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#.rst:
# Findtiny-process-library
# -------
#
# Finds the tiny-process-library library
#
# This will define the following variables::
#
#   tiny-process-library_FOUND    - True if the system has the tiny-process-library library
#   tiny-process-library_VERSION  - The version of the tiny-process-library library which was found
#
# and the following imported targets::
#
#   tiny-process-library::tiny-process-library   - The tiny-process-library library

find_path(tiny-process-library_INCLUDE_DIR
  NAMES process.hpp
  PATHS ${tiny-process-library_ROOT}/include
  PATH_SUFFIXES tiny-process-library
)
find_library(tiny-process-library_LIBRARY
  NAMES tiny-process-library
  PATHS ${tiny-process-library_ROOT}/lib
)

set(tiny-process-library_VERSION ${PC_tiny-process-library_VERSION})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(tiny-process-library
  FOUND_VAR tiny-process-library_FOUND
  REQUIRED_VARS
    tiny-process-library_LIBRARY
    tiny-process-library_INCLUDE_DIR
  VERSION_VAR tiny-process-library_VERSION
)

if(tiny-process-library_FOUND)
  set(tiny-process-library_LIBRARIES ${tiny-process-library_LIBRARY})
  set(tiny-process-library_INCLUDE_DIRS ${tiny-process-library_INCLUDE_DIR})
  set(tiny-process-library_DEFINITIONS ${PC_tiny-process-library_CFLAGS_OTHER})
endif()

if(tiny-process-library_FOUND AND NOT TARGET tiny-process-library::tiny-process-library)
  add_library(tiny-process-library::tiny-process-library UNKNOWN IMPORTED)
  set_target_properties(tiny-process-library::tiny-process-library PROPERTIES
    IMPORTED_LOCATION "${tiny-process-library_LIBRARY}"
    INTERFACE_COMPILE_OPTIONS "${PC_tiny-process-library_CFLAGS_OTHER}"
    INTERFACE_INCLUDE_DIRECTORIES "${tiny-process-library_INCLUDE_DIR}"
  )
endif()

mark_as_advanced(
  tiny-process-library_INCLUDE_DIR
  tiny-process-library_LIBRARY
)
