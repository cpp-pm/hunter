.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

What is it?
-----------

Every Hunter `release`_ (`Atom feed`_) archive is a meta-package with build
instructions and URLs of real packages.  The archive will be downloaded and
unpacked automatically by the ``HunterGate`` CMake module. You only need to set
the ``URL`` and ``SHA1``:

.. code-block:: cmake
  :emphasize-lines: 2-3

  HunterGate(
      URL "https://github.com/cpp-pm/hunter/archive/v0.23.297.tar.gz"
      SHA1 "3319fe6a3b08090df7df98dee75134d68e2ef5a3"
  )

Here is the content of the archive in simplified form:

.. code-block:: none

  Hunter (0.23.297) = {
      Boost (1.65.1, 1.65.0, 1.66.0, 1.66.0-p0, 1.67, ...),
      GTest (1.7.0, ...),
      OpenCV (4.1.1-p0, 4.0.0-p3, 3.4.6-p0, ...),
      OpenSSL (1.1.1, 1.1.1a, 1.1.1b, 1.1.1c, 1.1.1d, 1.1.1g, 1.1.1g-p0, ...),
      ...
  }

If you download and unpack it, you can view some internals. Let's look at the OpenSSL
package properties:

.. literalinclude:: what-is-it.sh
  :language: shell
  :start-after: # doc: download-start
  :end-before: # doc: download-end

`hunter.cmake`_ holds the list of available versions:

.. literalinclude:: what-is-it.sh
  :language: shell
  :start-after: # doc: version-start
  :end-before: # doc: version-end

.. code-block:: shell

      VERSION
      "1.1.1"
      URL
      "https://github.com/openssl/openssl/archive/OpenSSL_1_1_1.tar.gz"
  --
      VERSION
      "1.1.1a"
      URL
      "https://github.com/openssl/openssl/archive/OpenSSL_1_1_1a.tar.gz"
  --
      VERSION
      "1.1.1b"
      URL
      "https://github.com/openssl/openssl/archive/OpenSSL_1_1_1b.tar.gz"

Install instructions from build scheme `url_sha1_openssl.cmake.in`_:

.. literalinclude:: what-is-it.sh
  :language: shell
  :start-after: # doc: install-start
  :end-before: # doc: install-end

.. code-block:: none

  INSTALL_COMMAND
  make install_sw

Default version from `default.cmake`_
(is customizable, see :ref:`Config-ID <config-id>`):

.. literalinclude:: what-is-it.sh
  :language: shell
  :start-after: # doc: default-start
  :end-before: # doc: default-stop

.. code-block:: cmake

  hunter_default_version(OpenSSL VERSION 1.1.1)

.. seealso::

  * :doc:`Detailed sources layout </reference/layouts/sources>`
  * :doc:`Creating version on the fly from Git submodule </user-guides/hunter-user/git-submodule>`

.. _release: https://github.com/cpp-pm/hunter/releases
.. _Atom feed: https://github.com/cpp-pm/hunter/releases.atom
.. _default.cmake: https://github.com/cpp-pm/hunter/blob/master/cmake/configs/default.cmake
.. _hunter.cmake: https://github.com/cpp-pm/hunter/blob/master/cmake/projects/OpenSSL/hunter.cmake
.. _url_sha1_openssl.cmake.in: https://github.com/cpp-pm/hunter/blob/master/cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in
