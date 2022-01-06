.. spelling::

    gsl
    lite
    gsl-lite

.. index:: containers ; gsl-lite

.. _pkg.gsl-lite:

gsl-lite
========

-  `Official <https://github.com/martinmoene/gsl-lite>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/gsl-lite/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(gsl-lite)
    find_package(gsl-lite CONFIG REQUIRED)
    target_link_libraries(... gsl::gsl-lite)
