.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

CMake user
----------

This kind of developer can **read** CMake code that was written by more
experienced CMake developers. They understand some simple features such as
adding an executable with the ``add_executable`` command, and that this
command contains a list of source files associated with the executable.
They will probably have difficulty understanding why, in some cases, the
``include_directories`` command is called, but in others, ``target_include_directories``
is called instead. The main target of modifications is C++ code.

Such developers can:

* Add more targets to projects
* Add more sources to targets
* Add C++ flags that don't break compatibility (e.g. warnings/optimization)

Such developers can't:

* Add more external dependencies to project
* Adding flags that can break compatibility (e.g. ``-std=c++11`` or ``/MT``)

See also:

.. toctree::
  :maxdepth: 1

  Provide credentials to access protected sources <cmake-user/protected-sources>
  Downloading private data <cmake-user/private-data>
  Using license files <cmake-user/using-license-files>
