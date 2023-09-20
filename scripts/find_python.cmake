cmake_minimum_required(VERSION 3.5)

if(${CMAKE_VERSION} VERSION_LESS "3.12.0")
  find_package(PythonInterp 3 QUIET)
  if(NOT PYTHONINTERP_FOUND)
    message(FATAL_ERROR "Python not found")
  endif()
  message(${PYTHON_EXECUTABLE})
else()
  cmake_minimum_required(VERSION 3.12)

  if(DEFINED ENV{HUNTER_PYTHON_LOCATION})
    set(Python_ROOT_DIR $ENV{HUNTER_PYTHON_LOCATION})
    set(Python_FIND_STRATEGY LOCATION)
  endif()

  find_package(Python COMPONENTS Interpreter QUIET)

  if(NOT Python_Interpreter_FOUND)
    message(FATAL_ERROR "Python not found")
  endif()

  message(${Python_EXECUTABLE})
endif()