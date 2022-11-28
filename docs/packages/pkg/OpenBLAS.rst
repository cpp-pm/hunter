.. spelling::

    OpenBLAS
    Fortran
    LAPACK

.. index:: math ; OpenBLAS

.. _pkg.OpenBLAS:

OpenBLAS
========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.16.4-blue.svg
  :target: https://github.com/cpp-pm/hunter/releases/tag/v0.16.4
  :alt: Hunter v0.16.4

-  `Official <https://github.com/xianyi/OpenBLAS>`__
-  `Hunterized <https://github.com/hunter-packages/OpenBLAS>`__
- Available since |hunter|
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/OpenBLAS/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(OpenBLAS)
    find_package(OpenBLAS CONFIG REQUIRED)
    target_link_libraries(... OpenBLAS::OpenBLAS)

Starting with OpenBLAS v0.3.21 LAPACK support is enabled by default in Hunter.
This is due to upstream adding a f2c-converted copy of LAPACK 3.9.0 as fallback if no Fortran compiler is available.
