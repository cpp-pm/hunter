# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

#.rst:
# Findlibbacktrace
# -------
#
# Finds the libbacktrace library
#
# This will define the following variables::
#
#   libbacktrace_FOUND    - True if the system has the libbacktrace library
#   libbacktrace_VERSION  - The version of the libbacktrace library which was found
#
# and the following imported targets::
#
#   libbacktrace::libbacktrace   - The libbacktrace library

file(READ "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/install-root-dir" THIRDPARTY_INSTALL_ROOT_DIR)
file(GLOB_RECURSE THIRD_PARTY_LIBRARIES "${THIRDPARTY_INSTALL_ROOT_DIR}/*")
string(REPLACE ";" "\n" THIRD_PARTY_LIBRARIES_OUT "${THIRD_PARTY_LIBRARIES}")
message(STATUS "\n${THIRD_PARTY_LIBRARIES_OUT}\n")

find_path(libbacktrace_INCLUDE_DIR
  NAMES backtrace.h
  PATHS "${libbacktrace_ROOT}/include"
)
find_library(libbacktrace_LIBRARY
  NAMES backtrace
  PATHS "${libbacktrace_ROOT}/lib"
)

set(libbacktrace_VERSION ${PC_libbacktrace_VERSION})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libbacktrace
  FOUND_VAR libbacktrace_FOUND
  REQUIRED_VARS
    libbacktrace_LIBRARY
    libbacktrace_INCLUDE_DIR
  VERSION_VAR libbacktrace_VERSION
)

if(libbacktrace_FOUND)
  set(libbacktrace_LIBRARIES ${libbacktrace_LIBRARY})
  set(libbacktrace_INCLUDE_DIRS ${libbacktrace_INCLUDE_DIR})
  set(libbacktrace_DEFINITIONS ${PC_libbacktrace_CFLAGS_OTHER})
endif()

if(libbacktrace_FOUND AND NOT TARGET libbacktrace::libbacktrace)
  add_library(libbacktrace::libbacktrace UNKNOWN IMPORTED)
  set_target_properties(libbacktrace::libbacktrace PROPERTIES
    IMPORTED_LOCATION "${libbacktrace_LIBRARY}"
    INTERFACE_COMPILE_OPTIONS "${PC_libbacktrace_CFLAGS_OTHER}"
    INTERFACE_INCLUDE_DIRECTORIES "${libbacktrace_INCLUDE_DIR}"
  )
endif()

mark_as_advanced(
  libbacktrace_INCLUDE_DIR
  libbacktrace_LIBRARY
)
