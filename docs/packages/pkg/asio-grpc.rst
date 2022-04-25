.. spelling::

    asio-grpc

.. index::
  single: concurrency ; asio-grpc
  single: networking ; asio-grpc

.. _pkg.asio-grpc:

asio-grpc
=========

-  `Official <https://github.com/Tradias/asio-grpc>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/asio-grpc/CMakeLists.txt>`__
-  Added by `Tradias <https://github.com/Tradias>`__ (`pr-554 <https://github.com/cpp-pm/hunter/pull/554>`__)

.. literalinclude:: /../examples/asio-grpc/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

CMake options
-------------

The ``CMAKE_ARGS`` feature (see
`customization <https://hunter.readthedocs.io/en/latest/reference/user-modules/hunter_config.html>`__)
can be used to customize asio-grpc:

- To use standalone Asio instead of Boost.Asio:

  .. code-block:: cmake

    hunter_config(
        asio-grpc
        VERSION ${HUNTER_asio-grpc_VERSION}
        CMAKE_ARGS
          ASIO_GRPC_HUNTER_BACKEND_BOOST_ASIO=OFF
          ASIO_GRPC_HUNTER_BACKEND_STANDALONE_ASIO=ON
    )

- To use Boost.Container instead of ``<memory_resource>``:

  .. code-block:: cmake

    hunter_config(
        asio-grpc
        VERSION ${HUNTER_asio-grpc_VERSION}
        CMAKE_ARGS
          ASIO_GRPC_USE_BOOST_CONTAINER=ON
    )

For more options see `asio-grpc repository <https://github.com/Tradias/asio-grpc#cmake-options>`__.

