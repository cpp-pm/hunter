.. spelling:word-list::

    filament

.. index:: graphics ; filament

.. _pkg.filament:

filament
========

-  https://google.github.io/filament/Filament.html
-  `Official GitHub repo <https://github.com/google/filament>`__
-  `Hunterized <https://github.com/cpp-pm/filament>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/filament/main.cpp>`__

.. code-block:: cmake

    hunter_add_package(filament)
    find_package(filament CONFIG REQUIRED)
    target_link_libraries(... filament::filament)
