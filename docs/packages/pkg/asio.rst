.. spelling::

    asio
    asio_shared
    asio_headeronly

.. index:: networking ; asio

.. _pkg.asio:

asio
====

-  `Official <https://github.com/chriskohlhoff/asio>`__
-  `Hunterized <https://github.com/cpp-pm/asio>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/asio/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(asio)
    find_package(asio CONFIG REQUIRED)
    target_link_libraries(... asio::asio_static)

`asio::asio_shared` and `asio::asio_headeronly` targets are also available.
