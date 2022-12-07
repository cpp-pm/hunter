.. spelling::

    Redis++
    redis

.. index:: Redis++

.. _pkg.Redis++:

Redis++
=====

-  `Official <https://github.com/sewenew/redis-plus-plus/>`__
-  `Example
   CMakeLists.txt <https://github.com/cpp-pm/hunter/blob/master/examples/Redis++/CMakeLists.txt>`__
-  Added by `Ronny Nowak <https://github.com/Dargun>`__

.. code-block:: cmake

    hunter_add_package(HiRedis)
    find_package(HiRedis CONFIG REQUIRED)
    
    hunter_add_package(libuv)
    find_package(libuv CONFIG REQUIRED)

    hunter_add_package(Redis++)
    find_package(Redis++ CONFIG REQUIRED)

    target_link_libraries(... redis++::redis++_static uv)