.. spelling::

    eyalroz
    printf

.. index:: logging ; eyalroz_printf

.. _pkg.eyalroz_printf:

eyalroz_printf
==============

-  `Official <https://github.com/eyalroz/printf>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/eyalroz_printf/CMakeLists.txt>`__
-  Added by `Alexander Voronov <https://github.com/crvux>`__ (`pr-725 <https://github.com/cpp-pm/hunter/pull/725>`__)


.. literalinclude:: /../examples/eyalroz_printf/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

CMake options
-------------

The ``CMAKE_ARGS`` feature (see
`customization <https://hunter.readthedocs.io/en/latest/reference/user-modules/hunter_config.html>`__)
can be used to customize package:

- For example, to build static library:

  .. code-block:: cmake

    hunter_config(
        eyalroz_printf
        VERSION ${HUNTER_eyalroz_printf_VERSION}
        CMAKE_ARGS
            BUILD_SHARED_LIBS=OFF
    )

For more options see `original repository <https://github.com/eyalroz/printf/blob/master/CMakeLists.txt>`__.

