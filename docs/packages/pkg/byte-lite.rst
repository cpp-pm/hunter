.. spelling:word-list::

    byte
    lite
    byte-lite

.. index:: containers ; byte-lite

.. _pkg.byte-lite:

byte-lite
=========

-  `Official <https://github.com/martinmoene/byte-lite>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/byte-lite/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(byte-lite)
    find_package(byte-lite CONFIG REQUIRED)
    target_link_libraries(... nonstd::byte-lite)
