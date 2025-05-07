.. spelling::

    QuickCppLib
    quickcpplib
    ned14-internal-quickcpplib

.. _pkg.ned14-internal-quickcpplib:

ned14-internal-quickcpplib
==========================

-  `Official <https://github.com/ned14/quickcpplib>`__

.. code-block:: cmake

    find_package(Threads REQUIRED)
    hunter_add_package(ned14-internal-quickcpplib)
    find_package(quickcpplib CONFIG REQUIRED)
    target_link_libraries(... quickcpplib::hl Threads::Threads)

QuickCppLib is an internal dependency automatically retrieved by Outcome
and LLFIO and is only present here to ensure exactly reproducible builds.
Do not use it in your own projects.
