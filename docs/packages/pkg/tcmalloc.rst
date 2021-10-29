.. spelling::

    tcmalloc

.. index::
  single: unsorted ; tcmalloc

.. _pkg.tcmalloc:

tcmalloc
========

-  `Official <https://github.com/google/tcmalloc>`__
-  `Hunterized <https://github.com/cpp-pm/tcmalloc>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/tcmalloc/CMakeLists.txt>`__
-  Added by `Raffael Casagrande <https://github.com/craffael>`__ (`pr-N <https://github.com/cpp-pm/hunter/pull/N>`__)

.. literalinclude:: /../examples/tcmalloc/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

.. note::

  * Because tcmalloc must be linked as an object library (:code:`alwayslink` in bazel) it is recommended to use Cmake 3.21. 
    See the corresponding note on `<https://cmake.org/cmake/help/latest/command/target_link_libraries.html#linking-object-libraries-via-target-objects>`__
  * Because tcmalloc requires at least C++17 and because it depends on `abseil <https://github.com/abseil/abseil-cpp>`__, it is important to make sure that abseil is also built with C++17.
    Otherwise you may get link time errors related to :code:`std::basic_string_view`.
    The easiest way to achieve this is to use a :code:`CMAKE_TOOLCHAIN_FILE` that sets :code:`CMAKE_CXX_STANDARD` to :code:`17` or higher.