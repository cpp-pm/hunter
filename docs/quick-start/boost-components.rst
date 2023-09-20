.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

First step
----------

.. spelling::

  kung fu

Set `HUNTER_ROOT`_ environment variable to **an empty directory**. This
directory will be used by ``HunterGate`` module for storing packages and
utility files.  Using environment variable is recommended but not mandatory,
see `other options`_.

Set minimum CMake version:

.. code-block:: cmake

  cmake_minimum_required(VERSION 3.5)

Copy `HunterGate`_ module to your project and include it:

.. code-block:: none

  > mkdir cmake
  > wget https://raw.githubusercontent.com/cpp-pm/gate/master/cmake/HunterGate.cmake -O cmake/HunterGate.cmake

.. code-block:: cmake

  include("cmake/HunterGate.cmake")

This module will download archive automatically from ``URL`` that you provide
to the ``HUNTER_ROOT`` directory (it means that there is **no need to clone
this repository** in general, see `notes`_):

.. code-block:: cmake
  :emphasize-lines: 2, 3

  HunterGate(
      URL "https://github.com/cpp-pm/hunter/archive/v0.23.297.tar.gz"
      SHA1 "3319fe6a3b08090df7df98dee75134d68e2ef5a3"
  )

Now project can be started:

.. code-block:: cmake

  project(Foo)

Let's download and install ``boost.{regex,system,filesystem}``:

.. code-block:: cmake

  hunter_add_package(Boost COMPONENTS regex system filesystem)

Hunter part is done, now well known CMake-style kung fu (see :ref:`pkg.Boost`):

.. code-block:: cmake

  find_package(Boost CONFIG REQUIRED regex system filesystem)

  add_executable(foo foo.cpp)
  target_link_libraries(foo PUBLIC Boost::regex Boost::system Boost::filesystem)

Summarize:

.. code-block:: cmake
  :emphasize-lines: 5-6, 11

  cmake_minimum_required(VERSION 3.5)

  include("cmake/HunterGate.cmake")
  HunterGate(
      URL "https://github.com/cpp-pm/hunter/archive/v0.23.297.tar.gz"
      SHA1 "3319fe6a3b08090df7df98dee75134d68e2ef5a3"
  )

  project(Foo)

  hunter_add_package(Boost COMPONENTS regex system filesystem)
  find_package(Boost CONFIG REQUIRED regex system filesystem)

  add_executable(foo foo.cpp)
  target_link_libraries(foo PUBLIC Boost::regex Boost::system Boost::filesystem)

Build it:

.. code-block:: shell

  > cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON -DCMAKE_BUILD_TYPE=Release
  > cmake --build _builds --config Release

.. _HUNTER_ROOT: https://github.com/ruslo/hunter/wiki/usr.variables#hunter_root
.. _other options: https://github.com/cpp-pm/gate#effects
.. _HunterGate: https://github.com/cpp-pm/gate
.. _notes: https://github.com/cpp-pm/gate#notes
