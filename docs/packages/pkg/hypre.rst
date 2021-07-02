.. spelling::

    hypre

.. index::
  single: math ; hypre

.. _pkg.hypre:

hypre
=====

-  `Official <https://github.com/hypre-space/hypre>`__
-  `Example <https://github.com/hypre-space/hypre/tree/master/src/examples>`__
-  Added by `craffael <https://github.com/craffael>`__ (`pr-420 <https://github.com/cpp-pm/hunter/pull/420>`__)

.. literalinclude:: /../examples/hypre/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }


.. note::

    MPI is disabled by default.

    Use ``HYPRE_WITH_MPI=ON`` to enable it (and make sure MPI is installed on your system).

    .. code-block:: cmake

        # config.cmake
        hunter_config(hypre
            VERSION ${HUNTER_hypre_VERSION}
            CMAKE_ARGS
                HYPRE_WITH_MPI=ON
        )
