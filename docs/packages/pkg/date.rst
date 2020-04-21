.. spelling::

    date
    date_interface

.. index:: datetime ; date

.. _pkg.date:

date
====

- `Official <https://github.com/HowardHinnant/date>`__
- `Example <https://github.com/cpp-pm/hunter/blob/master/examples/date/CMakeLists.txt>`__

.. literalinclude:: /../examples/date/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

The target to link against changed upstream across versions:

- 2.4.1 and before, it is `date_interface`.
- 2.4.1-e12095f and after, it is `date::date`.
