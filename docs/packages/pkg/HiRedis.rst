.. spelling::

    HiRedis
    hiredis

.. index:: HiRedis

.. _pkg.HiRedis:

HiRedis
=======

-  `Official <https://github.com/redis/hiredis/>`__
-  `Example
   CMakeLists.txt <https://github.com/cpp-pm/hunter/blob/master/examples/HiRedis/CMakeLists.txt>`__
-  Added by `Ronny Nowak <https://github.com/Dargun>`__

.. code-block:: cmake

    hunter_add_package(HiRedis)
    find_package(HiRedis CONFIG REQUIRED)
    target_link_libraries(... hiredis::hiredis_static)