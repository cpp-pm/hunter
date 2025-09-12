.. spelling:word-list::

    stb
    textedit
    tilemap

.. index:: unsorted ; stb

.. _pkg.stb:

stb
===

-  `Official <https://github.com/nothings/stb>`__
-  `Hunterized <https://github.com/cpp-pm/stb>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/stb/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(stb)
    find_package(stb CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC stb::stb)

Notes
-----

Since v0.0.0-80c8f6a-p0, most stb libraries in Hunter (excluding stb_textedit and stb_tilemap_editor) have implementations built inside the Hunter package and downstream consumers use header files that do NOT respect the stb _IMPLEMENTATION flags. This is to ensure a single version of the stb libraries is built.
