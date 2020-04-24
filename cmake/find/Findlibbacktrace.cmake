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

find_path(libbacktrace_INCLUDE_DIR
  NAMES backtrace.h
  PATHS "${libbacktrace_ROOT}/include"
)

if(WIN32)
  set(_libbacktrace_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
  set(_libbacktrace_ORIG_CMAKE_FIND_LIBRARY_PREFIXES ${CMAKE_FIND_LIBRARY_PREFIXES})
  set(CMAKE_FIND_LIBRARY_SUFFIXES .so .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
  set(CMAKE_FIND_LIBRARY_PREFIXES lib ${CMAKE_FIND_LIBRARY_PREFIXES})
endif()

find_library(libbacktrace_LIBRARY
  NAMES backtrace
  PATHS "${libbacktrace_ROOT}/lib"
)

if(WIN32)
  # Restore the original find library ordering
  set(CMAKE_FIND_LIBRARY_SUFFIXES ${_libbacktrace_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES})
  set(CMAKE_FIND_LIBRARY_PREFIXES ${_libbacktrace_ORIG_CMAKE_FIND_LIBRARY_PREFIXES})
endif()

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
