.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. _cmake-simple:

CMake (no dependencies)
-----------------------

If your CMake code is correctly written and has no dependencies then release
with sources can be used **as is** in Hunter. There is no need to have
``HunterGate``/``hunter_add_package`` calls and no need to have a maintenance fork.

Examples of such packages:

* :ref:`pkg.flatbuffers`

  * https://github.com/google/flatbuffers
  * See `flatbuffers/hunter.cmake <https://github.com/cpp-pm/hunter/blob/08a6cbcf06bb5934b6b18aa1f2028cf56a1063b7/cmake/projects/flatbuffers/hunter.cmake#L23-L32>`__
  * Testing table: `AppVeyor <https://ci.appveyor.com/project/cpp-pm/hunter/build/1.0.3215>`__, `Travis <https://travis-ci.org/cpp-pm/hunter/builds/326881125>`__

* :ref:`pkg.rocksdb`

  * https://github.com/facebook/rocksdb
  * See `rocksdb/hunter.cmake <https://github.com/cpp-pm/hunter/blob/08a6cbcf06bb5934b6b18aa1f2028cf56a1063b7/cmake/projects/rocksdb/hunter.cmake#L19-L23>`__
  * Testing table: `Travis <https://travis-ci.org/cpp-pm/hunter/builds/326905326>`__

* :ref:`pkg.nlohmann_json`

  * https://github.com/nlohmann/json
  * See `nlohmann_json/hunter.cmake <https://github.com/cpp-pm/hunter/blob/08a6cbcf06bb5934b6b18aa1f2028cf56a1063b7/cmake/projects/nlohmann_json/hunter.cmake#L53-L58>`__
  * Testing table: `AppVeyor <https://ci.appveyor.com/project/cpp-pm/hunter/build/1.0.3217>`__, `Travis <https://travis-ci.org/cpp-pm/hunter/builds/326883658>`__

Default behavior
================

Please check that your package respect (i.e. does not rewrite) such CMake
variables like:

* `CMAKE_INSTALL_PREFIX <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_INSTALL_PREFIX.html>`__ (**critical**)
* `CMAKE_{C,CXX}_FLAGS + variations <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_LANG_FLAGS.html>`__ (**critical**)
* `CMAKE_{C,CXX}_COMPILER + friends <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_LANG_FLAGS.html>`__ (**critical**)
* `CMAKE_BUILD_TYPE <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_BUILD_TYPE.html>`__ (not critical, but recommended)
* `CMAKE_CONFIGURATION_TYPES <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_CONFIGURATION_TYPES.html>`__ (not critical, but recommended)
* `BUILD_SHARED_LIBS <http://www.cmake.org/cmake/help/v3.2/variable/BUILD_SHARED_LIBS.html>`__ (not critical, but may result some errors)

Environment
===========

Configuration of the package should be predictable.

For example it should not depend on the fact that some package already installed
or not:

.. code-block:: cmake
  :emphasize-lines: 2

  find_package(OpenSSL)
  if(OPENSSL_FOUND)
    target_compile_definitions(... PUBLIC FOO_WITH_OPENSSL=1)
  endif()

If package is optional then control behavior explicitly:

.. code-block:: cmake
  :emphasize-lines: 1, 5

  option(FOO_WITH_OPENSSL "Build with OpenSSL" ON)

  if(FOO_WITH_OPENSSL)
    find_package(OpenSSL REQUIRED) # fatal error if not found!
    target_compile_definitions(... PUBLIC FOO_WITH_OPENSSL=1)
  endif()

Same with the programs:

.. code-block:: cmake
  :emphasize-lines: 2

  find_program(PYTHON_EXE python) # Use 'find_package(PythonInterp)' in real code
  if(PYTHON_EXE)
    # generate some extra code
  endif()

Use this code instead:

.. code-block:: cmake
  :emphasize-lines: 1, 4, 6

  option(FOO_WITH_PYTHON "Build with Python" ON)

  if(FOO_WITH_PYTHON)
    find_program(PYTHON_EXE python)
    if(NOT PYTHON_EXE)
      message(FATAL_ERROR "Python not found")
    endif()
  endif()

Environment variable example:

.. code-block:: cmake
  :emphasize-lines: 1

  if(EXISTS "$ENV{FOO_EXTRA_CODE}")
    # add some code
  endif()

Solution:

.. code-block:: cmake
  :emphasize-lines: 1, 4

  option(FOO_WITH_EXTRA_CODE "Use extra code" ON)

  if(FOO_WITH_EXTRA_CODE)
    if(NOT EXISTS "$ENV{FOO_EXTRA_CODE}")
      message(FATAL_ERROR "...")
    endif()
  endif()

Note that this is kind of a natural limitation because otherwise Hunter have
to save the whole outside environment like default paths, environment
variables, etc. This is not doable on practice.

Exception is the variables related to compiler/toolchain like compiler version,
compiler id, platforms, generators, architectures: ``WIN32``, ``IOS``,
``ANDROID``, etc. Number of such traits is limited and forms
:doc:`toolchain-id </overview/customization/toolchain-id>`.

.. admonition:: CGold

  * `Depending on environment variable <http://cgold.readthedocs.io/en/latest/tutorials/variables/environment.html#no-tracking>`__

.. _create new install xxxconfig:

Install XXXConfig.cmake
=======================

The easiest way to integrate installed libraries into other project is to use
`find_package <https://cmake.org/cmake/help/latest/command/find_package.html>`__
command. Project should generate and install ``*Config.cmake`` files instead
of using ``Find*.cmake`` modules. It's the one of the painless ways to support
relocation - imported targets can be cached and downloaded as prebuilt binary
archive from build servers. Plus only imported targets works nicely with non
standard build types like ``MinSizeRel`` or ``RelWithDebInfo``.

To check this feature you can try to install files to local directory.
If result of installation looks like this:

.. code-block:: none
  :emphasize-lines: 4-5

  Install the project...
  /.../cmake -P cmake_install.cmake
  -- Install configuration: "Release"
  -- Installing: /.../lib/libhunter_box_1.a
  -- Installing: /.../include/hunter_box_1.hpp

It means that this feature is missing and you need to
:doc:`patch CMake code </creating-new/patch>` to introduce it.
Details can be found
`here <https://github.com/ruslo/hunter/wiki/example.find_package.config>`__.

Installation after fix:

.. code-block:: none
  :emphasize-lines: 6-9

  Install the project...
  /.../cmake -P cmake_install.cmake
  -- Install configuration: "Release"
  -- Installing: /.../lib/libhunter_box_1.a
  -- Installing: /.../include/hunter_box_1.hpp
  -- Installing: /.../lib/cmake/hunter_box_1/hunter_box_1Config.cmake
  -- Installing: /.../lib/cmake/hunter_box_1/hunter_box_1ConfigVersion.cmake
  -- Installing: /.../lib/cmake/hunter_box_1/hunter_box_1Targets.cmake
  -- Installing: /.../lib/cmake/hunter_box_1/hunter_box_1Targets-release.cmake

.. admonition:: CGold

  * `Rejected: FindXXX.cmake <http://cgold.readthedocs.io/en/latest/rejected/find-modules.html>`__
  * `Install layout <http://cgold.readthedocs.io/en/latest/tutorials/install/layout.html>`__

.. admonition:: CMake documentation

  * `find_package <https://cmake.org/cmake/help/latest/command/find_package.html>`__
  * `cmake-packages <https://cmake.org/cmake/help/latest/manual/cmake-packages.7.html>`__

Add package to Hunter
=====================

Next let's assume user `hunterbox <https://github.com/hunterbox>`__ is
trying to add `hunter_box_1 <https://github.com/hunterbox/hunter_box_1>`__
project to Hunter.

.. admonition:: Examples on GitHub

  * `Example: hunterbox/hunter_box_1 <https://github.com/hunterbox/hunter_box_1>`__

Recommended name for the package is lowercase separated with underscore.

C++:

.. code-block:: cpp

  #include <hunter_box_1/hunter_box_1.hpp>

  int main() {
    hunter_box_1::foo();
  }

.. code-block:: cpp

  // file hunter_box_1.hpp

  namespace hunter_box_1 {
  } // namespace hunter_box_1

CMake with Hunter:

.. code-block:: cmake

  hunter_add_package(hunter_box_1)
  find_package(hunter_box_1 CONFIG REQUIRED)
  target_link_libraries(... hunter_box_1::hunter_box_1)

In Hunter sources:

* ``cmake/projects/hunter_box_1/hunter.cmake`` file with versions
* ``examples/hunter_box_1`` directory with example for testing
* ``docs/packages/pkg/hunter_box_1.rst`` documentation for package

Fork Hunter
===========

Hunter hosted on GitHub service where common way to add code is to fork
project and create pull request.

Fork `cpp-pm/hunter <https://github.com/cpp-pm/hunter>`__, clone
`your fork <https://github.com/hunterbox/hunter>`__ and initialize all
submodules:

.. code-block:: none

  > git clone https://github.com/hunterbox/hunter
  > cd hunter
  [hunter]> git submodule update --init --recursive .

Create branch to work on new package:

.. code-block:: none

  [hunter]> git checkout -b pr.hunter_box_1

Add versions
============

Add one or several versions of ``hunter_box_1`` package to corresponding
``hunter.cmake`` file.

Copy template and substitute all strings ``foo`` to ``hunter_box_1``:

.. code-block:: none

  [hunter]> cp -r cmake/projects/foo cmake/projects/hunter_box_1
  [hunter]> sed -i 's,foo,hunter_box_1,g' cmake/projects/hunter_box_1/hunter.cmake

Download release archive and calculate ``SHA1``:

.. code-block:: none

  > wget -O- https://github.com/hunterbox/hunter_box_1/archive/v1.0.0.tar.gz | openssl sha1
  SHA1(stdin)= 4fa7fe75629f148a61cedc6ba0bce74f177a6747

Add this information to ``cmake/projects/hunter_box_1/hunter.cmake`` file:

.. code-block:: cmake
  :emphasize-lines: 10, 12, 14, 16

  # !!! DO NOT PLACE HEADER GUARDS HERE !!!

  include(hunter_add_version)
  include(hunter_cacheable)
  include(hunter_download)
  include(hunter_pick_scheme)

  hunter_add_version(
      PACKAGE_NAME
      hunter_box_1
      VERSION
      1.0.0
      URL
      "https://github.com/hunterbox/hunter_box_1/archive/v1.0.0.tar.gz"
      SHA1
      4fa7fe75629f148a61cedc6ba0bce74f177a6747
  )

  hunter_pick_scheme(DEFAULT url_sha1_cmake)
  hunter_cacheable(hunter_box_1)
  hunter_download(PACKAGE_NAME hunter_box_1)

Consistency
===========

Please keep Git tag and ``VERSION`` in consistent state.
For example if ``URL`` is:

.. code-block:: cmake
  :emphasize-lines: 3-4

  hunter_add_version(
      # ...
      URL
      "https://github.com/hunterbox/hunter_box_1/archive/v1.3.15-da39a3e-p6.tar.gz"
      # ...
  )

Then ``VERSION`` should be:

.. code-block:: cmake
  :emphasize-lines: 3-4

  hunter_add_version(
      # ...
      VERSION
      1.3.15-da39a3e-p6
      URL
      "https://github.com/hunterbox/hunter_box_1/archive/v1.3.15-da39a3e-p6.tar.gz"
      # ...
  )

CMake options
=============

Note that it does not make sense to build and install stuff like examples,
tests or documentation. Please check that your package has CMake options to
disable those. If such an option is not disabled by default use
``hunter_cmake_args``:

.. code-block:: cmake
  :emphasize-lines: 1, 6, 9-11

  include(hunter_cmake_args)

  # ...

  # bottom of cmake/projects/foo/hunter.cmake
  hunter_cmake_args(
      foo
      CMAKE_ARGS
          FOO_BUILD_EXAMPLES=OFF
          FOO_BUILD_TESTS=OFF
          FOO_BUILD_DOCUMENTATION=OFF
  )

  hunter_pick_scheme(DEFAULT url_sha1_cmake)
  hunter_download(PACKAGE_NAME foo)

Options set by ``hunter_cmake_args`` have lower precedence than options set
by ``hunter_config(... CMAKE_ARGS ...)`` (see
`order <https://github.com/ruslo/hunter/wiki/example.custom.config.id#order>`__).

Build types
===========

.. warning::

  Usually there is no need to set a build type explicitly. If the package does not
  work with default ``Debug`` + ``Release`` it means something is wrong with
  the package itself.

Default build type(s) can be set by ``hunter_configuration_types``:

.. code-block:: cmake

  hunter_configuration_types(foo CONFIGURATION_TYPES Release)
  hunter_download(PACKAGE_NAME foo)

User can overwrite this default by using
`custom <https://github.com/ruslo/hunter/wiki/example.custom.config.id>`__
``hunter_config`` parameters.

Set default version
===================

Add ``hunter_default_version`` directive with default version to
``cmake/configs/default.cmake``:

.. code-block:: cmake

  hunter_default_version(hunter_box_1 VERSION 1.0.0)

Create example
==============

 To test the integration of the package into another project a simple example will be used.
 Copy the template example and substitute all strings ``foo`` with ``hunter_box_1``:

.. code-block:: none

  [hunter]> cp -r examples/foo examples/hunter_box_1
  [hunter]> sed -i 's,foo,hunter_box_1,g' examples/hunter_box_1/*

Tweak all files in ``examples/hunter_box_1`` directory to fit headers and
names of imported targets.

Add documentation
=================

Each package should have a
:doc:`page with information and usage example </packages/all>`.

To create such a page copy the template file and substitute all strings ``foo`` with
the project name (for example ``hunter_box_1``):

.. code-block:: none

  [hunter]> cp docs/packages/pkg/foo.rst docs/packages/pkg/hunter_box_1.rst
  [hunter]> sed -i 's,foo,hunter_box_1,g' docs/packages/pkg/hunter_box_1.rst

Open file ``docs/packages/pkg/hunter_box_1.rst`` and tweak all entries.

Substitute ``unsorted`` with some tag in directive
``single: unsorted ; foo``. This tag will be used on
:ref:`this page <genindex>`.

If you want to have two tags add another line with ``single``:

.. code-block:: none

  .. index::
    single: category_1 ; foo
    single: category_2 ; foo

.. seealso::

  * `Gentoo packages <https://packages.gentoo.org/categories>`__
  * `Ubuntu packages <https://packages.ubuntu.com/>`__

.. note::

  Since you don't know the pull request number a priori leave it as ``N`` for now.
  You can update it later.

Commit
======

Now save all changes by doing a commit:

.. code-block:: none

  [hunter]> git branch
    master
  * pr.hunter_box_1

  [hunter]> git add cmake/configs/default.cmake
  [hunter]> git add cmake/projects/hunter_box_1/
  [hunter]> git add docs/packages/pkg/hunter_box_1.rst
  [hunter]> git add examples/hunter_box_1/

  [hunter]> git commit -m "Add 'hunter_box_1' package"

.. include:: ../test.rst
  :end-before: toctree

Pull requests
=============

After CI testing is done you can open a pull request with package:

.. code-block:: none

  [hunter]> git checkout pr.hunter_box_1
  [hunter]> git push -u origin pr.hunter_box_1

.. image:: /creating-new/images/pr-with-package.png
  :align: center
  :alt: PR with package

At this moment you know the pull request number:

.. image:: /creating-new/images/pr-number.png
  :align: center
  :alt: Pull request number

Add it to documentation:

.. code-block:: none

  [hunter]> git checkout pr.hunter_box_1
  [hunter]> vim docs/packages/pkg/hunter_box_1.rst
  [hunter]> git add docs/packages/pkg/hunter_box_1.rst
  [hunter]> git commit -m 'Pull request number'
  [hunter]> git push

Pull request will be approved and tests run on CI, documentation will be
tested automatically:

.. image:: /creating-new/images/package-testing.png
  :align: center
  :alt: Package testing

Release
=======

After all tests pass the pull request will be merged.
New release will be created:

You can use new ``URL``/``SHA1``:

.. image:: /creating-new/images/release.png
  :align: center
  :alt: Release

Clean
=====

At this moment working branch can be removed:

.. code-block:: none

  [hunter]> git checkout master
  [hunter]> git push origin :pr.hunter_box_1
  [hunter]> git branch -D pr.hunter_box_1

Badge
=====

Badge in ``README.rst`` can signal that package ``hunter_box_1`` is available
via Hunter:

.. code-block:: none

  |hunter|

  .. |hunter| image:: https://img.shields.io/badge/hunter-hunter_box_1-blue.svg
    :target: https://hunter.readthedocs.io/en/latest/packages/pkg/hunter_box_1.html
    :alt: Hunter

Example:

* https://github.com/hunter-packages/gauze/blob/master/README.rst
