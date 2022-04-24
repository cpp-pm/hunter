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
-  Added by `Tradias <https://github.com/Tradias>`__ (`pr-N <https://github.com/cpp-pm/hunter/pull/N>`__)

.. literalinclude:: /../examples/asio-grpc/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

Other backends
--------------

Asio-grpc can be used with Boost.Asio, standalone Asio or libunifex. Example using standalone Asio:

.. code-block:: cmake

  hunter_add_package(gRPC)
  hunter_add_package(asio)
  hunter_add_package(asio-grpc)
  find_package(asio-grpc CONFIG REQUIRED)

  add_executable(boo boo.cpp)
  target_link_libraries(boo PUBLIC asio-grpc::asio-grpc-standalone-asio)

CMake options
-------------

The ``CMAKE_ARGS`` feature (see
`customization <https://hunter.readthedocs.io/en/latest/reference/user-modules/hunter_config.html>`__)
can be used to customize asio-grpc:

- To use Boost.Container instead of ``<memory_resource>``:

  .. code-block:: cmake

    hunter_config(
        asio-grpc
        VERSION ${HUNTER_asio-grpc_VERSION}
        CMAKE_ARGS ASIO_GRPC_USE_BOOST_CONTAINER=1
    )
  
  Make sure to add package Boost.Container before finding asio-grpc:

  .. code-block:: cmake

    hunter_add_package(Boost COMPONENTS container)
    find_package(asio-grpc CONFIG REQUIRED)

For more options see `asio-grpc repository <https://github.com/Tradias/asio-grpc#cmake-options>`__.

