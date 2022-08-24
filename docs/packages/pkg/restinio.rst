.. spelling::

    restinio

.. index:: networking ; restinio

.. _pkg.restinio:

restinio
========

-  `Official <https://github.com/Stiffstream/restinio>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/restinio/CMakeLists.txt>`__

.. code-block:: cmake

    find_package(Threads REQUIRED)

    hunter_add_package(asio)
    find_package(asio CONFIG REQUIRED)

    hunter_add_package(http-parser)
    find_package(http-parser CONFIG REQUIRED)

    hunter_add_package(fmt)
    find_package(fmt CONFIG REQUIRED)

    hunter_add_package(restinio)
    find_package(restinio CONFIG REQUIRED)
    target_link_libraries(... restinio::restinio)

The reason you must manually bring in restinio's dependencies is because
it is a header only library defined as an INTERFACE cmake target.
