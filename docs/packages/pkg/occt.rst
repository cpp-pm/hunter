.. spelling:word-list::

    occt

.. index::
  single: math ; occt

.. _pkg.occt:

occt
====
OpenCascade Community Technology

-  `Official <https://dev.opencascade.org/>`__
-  `Hunterized <https://github.com/cpp-pm/occt>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/occt/CMakeLists.txt>`__
-  Added by `craffael <https://github.com/craffael>`__ (`pr-295 <https://github.com/cpp-pm/hunter/pull/295>`__)

.. literalinclude:: /../examples/occt/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }
  
.. note::

  * OpenCascade consists of a number of modules. This Hunterized version supports all modules except
    the `Draw Test Harness <https://www.opencascade.com/doc/occt-7.4.0/overview/html/technical_overview.html#OCCT_TOVW_SECTION_8>`__.
  * To build shared versions of occt (recommended), please use :ref:`HUNTER_BUILD_SHARED_LIBS=ON <hunter build shared libs>` 
    or build with :ref:`toolchain with PIC <simple toolchains>`.
  * On Ubuntu, make sure that you have installed the following system packages: :code:`mesa-common-dev`, :code:`libgl1-mesa-dev`, :code:`libxmu-dev`, :code:`libxi-dev`

