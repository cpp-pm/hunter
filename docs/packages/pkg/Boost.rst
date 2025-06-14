.. index:: frameworks ; Boost

.. _pkg.Boost:

Boost
=====

.. code-block:: cmake

    # Header-only libraries
    hunter_add_package(Boost)
    find_package(Boost CONFIG REQUIRED)
    target_link_libraries(... Boost::headers)

-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/Boost/CMakeLists.txt>`__

.. code-block:: cmake

    # Boost components (see list below)
    hunter_add_package(Boost COMPONENTS system filesystem)
    find_package(Boost CONFIG REQUIRED system filesystem)
    target_link_libraries(... Boost::system Boost::filesystem)

Examples:

- `Boost-uuid <https://github.com/cpp-pm/hunter/blob/master/examples/Boost-uuid/CMakeLists.txt>`__
- `Boost-system <https://github.com/cpp-pm/hunter/blob/master/examples/Boost-system/CMakeLists.txt>`__
- `Boost-iostreams <https://github.com/cpp-pm/hunter/blob/master/examples/Boost-iostreams/CMakeLists.txt>`__
- `Boost-filesystem <https://github.com/cpp-pm/hunter/blob/master/examples/Boost-filesystem/CMakeLists.txt>`__
- `Boost-math <https://github.com/cpp-pm/hunter/blob/master/examples/Boost-math/CMakeLists.txt>`__
- `Boost-contract <https://github.com/cpp-pm/hunter/blob/master/examples/Boost-contract/CMakeLists.txt>`__
- `Boost-stacktrace <https://github.com/cpp-pm/hunter/blob/master/examples/Boost-stacktrace/CMakeLists.txt>`__

List of components and availability (other libraries are header-only):

.. literalinclude:: /../cmake/modules/hunter_get_boost_libs.cmake
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

CMake options
-------------

You can use ``CMAKE_ARGS`` feature
(see
`customization <https://github.com/ruslo/hunter/wiki/example.custom.config.id#custom-cmake-options>`__)
to pass options to boost build or to append config macros in the default boost user
config file (``boost/config/user.hpp``):

- Options of special form ``<COMPONENT-UPPERCASE>_<OPTION>=<VALUE>`` will
  be added to ``b2`` as ``-s <OPTION>=<VALUE>`` while building component .
  For example:

  .. code-block:: cmake

    # Add 'NO_BZIP2=1' to the b2 build of iostreams library,
    # i.e. `b2 -s NO_BZIP2=1`
    hunter_config(
        Boost
        VERSION ${HUNTER_Boost_VERSION}
        CMAKE_ARGS IOSTREAMS_NO_BZIP2=1
    )

-  `boost.iostreams
   options <http://www.boost.org/doc/libs/1_57_0/libs/iostreams/doc/index.html?path=7>`__

- Options ``CONFIG_MACRO_<ID>=<VALUE>`` will append ``#define <ID> <VALUE>``
  to the default boost user config header file. And options
  ``CONFIG_MACRO=<ID_1>;<ID_2>;...;<ID_n>`` will append ``#define <ID_1>``,
  ``#define <ID_2>``, ..., ``#define <ID_n>``.
  Example:

  .. code-block:: cmake

    hunter_config(
        Boost
        VERSION ${HUNTER_Boost_VERSION}
        CMAKE_ARGS
        CONFIG_MACRO=BOOST_REGEX_MATCH_EXTRA;BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS
        CONFIG_MACRO_BOOST_MPL_LIMIT_LIST_SIZE=3
    )

  Will append the next lines to ``boost/config/user.hpp``:

  .. code-block:: cpp

    #define BOOST_REGEX_MATCH_EXTRA
    #define BOOST_MPL_CFG_NO_PREPROCESSED_HEADERS
    #define BOOST_MPL_LIMIT_LIST_SIZE 3

- Option ``USE_CONFIG_FROM_BOOST=ON`` was removed with Hunter ``v0.26.0``,
  now the package configuration file is always provided by the Boost project.

- Option ``BOOST_USE_WINAPI_VERSION=<API_VERSION>`` use on Windows in order to set the Windows API version used for building the boost libraries.

  Since Boost 1.78.0 Boost.Log exports additional symbols when building for Windows 8 or newer.
  So it is recommended to set the CMake variable ``BOOST_USE_WINAPI_VERSION`` in the CMake-toolchain file (or the ``CMAKE_ARGS``) to the same value as the defines ``_WIN32_WINNT`` and ``WINVER``.

  - `Boost.WinAPI documentation <https://www.boost.org/doc/libs/1_79_0/libs/winapi/doc/html/winapi/config.html>`__

  The version passed must match the hexadecimal integer values used for ``_WIN32_WINNT`` and ``WINVER``.
  The version numbers are described in
  `Windows Headers documentation <https://docs.microsoft.com/en-us/windows/win32/winprog/using-the-windows-headers?redirectedfrom=MSDN#macros_for_conditional_declarations>`__.

  ``API_VERSION`` is passed as a hexadecimal integer e.g. ``BOOST_USE_WINAPI_VERSION=0x0603`` sets the Windows API version to Windows 8.1.

Python
------

To require Boost Python to be built against a specific version of Python installed
on the system, option ``PYTHON_VERSION=<VALUE>`` may be used. In this case,
if the required components of Python are located, ``user_config.jam``
will be appended with the following line:

.. code-block:: none

  using python  : <requested_version_number> : <path to Python executable> :
  <path to Python include directory> : <path to directory containing the Python library> ;

Example for Python 2:

.. code-block:: cmake

    # config.cmake
    hunter_config(
      Boost
      VERSION ${HUNTER_Boost_VERSION}
      CMAKE_ARGS
      PYTHON_VERSION=2.7.15
    )

.. code-block:: cmake

    # CMakeLists.txt
    hunter_add_package(Boost COMPONENTS python)
    if(Boost_VERSION VERSION_LESS 106700)
      find_package(Boost CONFIG REQUIRED python)
    else()
      find_package(Boost CONFIG REQUIRED python27)
    endif()

.. note::

  Python<x> component arguments to ``find_package(Boost ...)`` after Boost version 1.67 require
  a specific version suffix, e.g. python37.

Example for Python 3:

.. code-block:: cmake

    # config.cmake
    hunter_config(
      Boost
      VERSION ${HUNTER_Boost_VERSION}
      CMAKE_ARGS
      PYTHON_VERSION=3.6.7
    )

.. code-block:: cmake

    # CMakeLists.txt
    hunter_add_package(Boost COMPONENTS python)
    if(Boost_VERSION VERSION_LESS 106700)
      find_package(Boost CONFIG REQUIRED python3)
    else()
      find_package(Boost CONFIG REQUIRED python36)
    endif()


Python NumPy
------------

To build the NumPy plugin for Boost Python use option ``HUNTER_ENABLE_BOOST_PYTHON_NUMPY=True``.
This will require ``pip_numpy`` and therefore ``hunter_venv``, see their docs for details and
requirements.

Example:

.. code-block:: cmake

    # config.cmake
    hunter_config(
      Boost
      VERSION ${HUNTER_Boost_VERSION}
      CMAKE_ARGS
      PYTHON_VERSION=${PYTHON_VERSION}
      HUNTER_ENABLE_BOOST_PYTHON_NUMPY=True
    )

Math
----

When using Boost Math you will need to link in the libraries, however these are not named ``math`` but
rather are individual based on what you need to link it, the easiest of which is to link in all parts:

.. code-block:: cmake

    hunter_add_package(Boost COMPONENTS math)
    find_package(Boost CONFIG REQUIRED math_c99 math_c99f math_c99l math_tr1 math_tr1f math_tr1l)
    target_link_libraries(...
      Boost::math_c99
      Boost::math_c99f
      Boost::math_c99l
      Boost::math_tr1
      Boost::math_tr1f
      Boost::math_tr1l
    )

If you are using only the header-only parts of Boost::Math then the libraries can be ignored:

.. code-block:: cmake

    hunter_add_package(Boost COMPONENTS math)
    find_package(Boost CONFIG REQUIRED)
