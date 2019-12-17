.. Copyright (c) 2019, NeroBurner
.. All rights reserved.

.. spelling::

  subdir

.. _hunter_source_subdir:

hunter_source_subdir
--------------------

* `Source <https://github.com/cpp-pm/hunter/blob/master/cmake/modules/hunter_source_subdir.cmake>`__
* `Example <https://github.com/cpp-pm/hunter/blob/master/cmake/projects/zstd/hunter.cmake>`__

For projects where the ``CMakeLists.txt`` is not in the root of the project tree
this command can be used to specify the sub-folder the CMake project file is in.

The value is used to set the `ExternalProject_Add`_ command sub-option ``SOURCE_SUBDIR``.

It is meant to be used in the project definition at
``project/<ProjectName>/hunter.cmake``:

.. code-block:: cmake

  hunter_source_subdir(
      ${package}
      # SOURCE_SUBDIR will be forwarded to ExternalProject_Add command
      SOURCE_SUBDIR "cpp"
  )

.. _ExternalProject_Add: http://www.cmake.org/cmake/help/v3.0/module/ExternalProject.html
