.. spelling::

    msgpack
    msgpackc

.. index:: unsorted ; msgpack
  

.. _pkg.msgpack:

msgpack
=======

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.14.19-blue.svg
  :target: https://github.com/cpp-pm/hunter/releases/tag/v0.14.19
  :alt: Hunter v0.14.19

-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/msgpack/CMakeLists.txt>`__
-  Added by `Antal Tátrai <https://github.com/tatraian>`__
   (`pr-406 <https://github.com/ruslo/hunter/pull/406>`__)
- Available since |hunter|
- Target library renamed from ``msgpack::msgpack`` to ``msgpackc-cxx`` with ``v4.1.3``

.. code-block:: cmake

    hunter_add_package(msgpack)
    find_package(msgpack CONFIG REQUIRED)
    target_link_libraries(... PRIVATE msgpackc-cxx)
