.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Notes about version of CMake
----------------------------

* `3.10.0`_ **Minimum required**

  * CMake upstream dropping support for versions before 3.10
  * `CMake release notes <https://cmake.org/cmake/help/latest/release/3.31.html#deprecated-and-removed-features>`__
  * Since: `PR #769 <https://github.com/cpp-pm/hunter/pull/769>`__

* `3.5.0`_

  * Since: `PR #689 <https://github.com/cpp-pm/hunter/pull/689>`__

  * New variable `CMAKE_IOS_INSTALL_COMBINED <https://cmake.org/cmake/help/v3.5/variable/CMAKE_IOS_INSTALL_COMBINED.html>`__
  * `iOS toolchains <http://polly.readthedocs.io/en/latest/toolchains/ios.html>`__

* `3.7.0`_

  * Minimum version for packages with
    :doc:`protected sources </user-guides/cmake-user/protected-sources>`
  * ``USERPWD`` sub-option for ``file(DOWNLOAD|UPLOAD ...)``
  * ``HTTP_{USERNAME|PASSWORD}`` sub-options for ``ExternalProject_Add``
  * List of URLs can be passed to ``ExternalProject_Add``.
    Used by :ref:`hunter download server`.

* `3.7.1`_ **Minimum for Android projects**

  * CMake now supports Cross Compiling for Android with simple toolchain files
  * `Polly Android toolchains <http://polly.readthedocs.io/en/latest/toolchains/android.html#android-ndk-x-api-y>`__

* `3.9.2`_ **Minimum for Android NDK r16+**

.. tip::

  * `CMake milestones <https://gitlab.kitware.com/cmake/cmake/milestones?state=all>`__ (`old version <https://cmake.org/Bug/changelog_page.php>`__)

.. note::

  If you're building CMake from sources please make sure that
  :doc:`HTTPS support is enabled in CURL </faq/how-to-fix-download-error>`.

.. note::

  CMake 3.5 can be used with Hunter versions before v0.26.

  In theory CMake 3.0 can be used with Hunter versions before v0.22 but in
  practice you have to work with v0.14.3 because ``continue`` added to
  v0.14.4 code.

.. note::

  Latest Hunter release with support of old Android toolchains
  (before CMake 3.7.1) is v0.16.36

.. _3.10.0: https://www.cmake.org/cmake/help/v3.10/release/3.10.html#platforms
.. _3.5.0: https://www.cmake.org/cmake/help/v3.5/release/3.5.html#platforms
.. _3.7.0: https://cmake.org/cmake/help/latest/release/3.7.html#commands
.. _3.7.1: https://cmake.org/cmake/help/latest/release/3.7.html#platforms
.. _3.9.2: https://gitlab.kitware.com/cmake/cmake/issues/17253
