.. spelling::

    zstd
    libzstd_shared

.. index:: compression ; zstd

.. _pkg.zstd:

zstd
====

-  `Official <https://github.com/facebook/zstd>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/zstd/CMakeLists.txt>`__

.. code-block:: cmake

    find_package(Threads REQUIRED)
    hunter_add_package(zstd)
    find_package(zstd CONFIG REQUIRED)
    target_link_libraries(... zstd::libzstd_static Threads::Threads)

`zstd::libzstd_shared` target is also available. It will already be
linked with `Threads::Threads`.
