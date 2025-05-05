.. Copyright (c) 2020, Dmitry Rodin
.. All rights reserved.

.. spelling::

  workflow
  json

.. _ci testing:

CI testing
----------

Refer to `GitHub Actions Documentation <https://docs.github.com/en/actions>`__
for better understanding of Hunter CI testing.

Two types of tests are performed, and appropriate `workflows <https://docs.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow>`__ run:

1) **Documentation testing.**

* This workflow will run if any file in ``docs`` or ``examples`` directory has been changed.
* This is done to ensure that documentation is building correctly.

2) **Package build testing with various toolchains.**

* This workflow will run if any file in ``cmake/projects`` directory has been changed.
* Default toolchains for tests are:

  * Windows: Visual Studio, NMake, Ninja, MinGW, MSYS
  * Linux: GCC, Clang, Android, Clang Analyzer, Sanitize Address, Sanitize Leak
  * macOS: Clang + Makefile, Xcode, iOS

.. _override default tests:

Override default tests
======================

GitHub Actions `workflow files <https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions>`__ are located in ``.github/workflows``:

.. warning::
  **Please don't modify these files.** Review them to understand test steps.

* ``ci-docs.yml`` - workflow file for testing documentation

  * Checks if files in ``docs`` or ``examples`` directories have been changed
  * If that's the case, runs :ref:`documentation testing <testing documentation locally>` on GitHub Ubuntu runner

* ``ci.yml`` - workflow file for package build testing

  * Checks which files in ``cmake/projects`` directory have been changed
  * Sets up `build matrix`_ accordingly
  * Runs builds on `GitHub-hosted runners <https://docs.github.com/en/actions/reference/virtual-environments-for-github-hosted-runners>`__
  * Uploads jobs status to GitHub Pages - `Pakages status <https://cpp-pm.github.io/hunter/>`__

* ``set_matrix.py`` - script to perform build strategy matrix manipulation

  * Checks if package has overridden build matrix
  * If not, substitutes **example** property of the default matrix with project's name
  * Checks if package has a  build script override and sets build script accordingly
  * Merges build matrices if multiple projects are tested

* ``set_status.py`` - script to perform manipulations with `job's status .json <https://docs.github.com/en/rest/reference/actions#list-jobs-for-a-workflow-run>`__

  * Splits job's .json if multiple projects were tested in one workflow run
  * Sorts by toolchain alphabetically

Default package build strategy matrix and scripts are located in ``.github/workflows/ci``:

.. warning::
  **Please don't modify these files.** Instead create a ``ci`` subdirectory in your package directory
  and copy files, that you need to change, there.

* ``matrix.json`` - *include* part of `GitHub Actions build strategy matrix <https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#example-including-additional-values-into-combinations>`__
* ``build.sh`` - build script for \*nix systems
* ``build.cmd`` - build script for Windows

Build matrix
^^^^^^^^^^^^

.. warning::
  Don't copy and modify the default matrix if your package doesn't have components and you only need to change build scrips.
  This will lead to you project testing toolchains diverge from default ones in the future.

.. literalinclude:: ../../../.github/workflows/ci/matrix.json
  :language: JSON

Each line defines parameters for a job that will run on `GitHub-hosted runner <https://docs.github.com/en/actions/reference/virtual-environments-for-github-hosted-runners>`__:

* **example** - subdirectory name in the ``examples`` directory.
  You need to change the default value ``foo`` to your project's (or project component's) example directory name
* **toolchain** - `Polly <https://github.com/cpp-pm/polly>`__ toolchain
* **os** - `Supported GitHub-hosted runner <https://docs.github.com/en/actions/reference/virtual-environments-for-github-hosted-runners#supported-runners-and-hardware-resources>`__.
  Set this according to toolchain.
* **python** - Override Python version used for job.
  Change this if your project uses Python scripts (that require specific Python version) for testing.
* **script** - Script executed before ``build.py`` calls ``cmake`` on the runner.
  The path of the script is relative to the directory where ``matrix.json`` is located.
  If the script with defined name was not found in this path ``set_matrix.py`` raises an exception.
  If no script override is specified a ``build.sh`` (Ubuntu and macOS) or ``build.cmd`` (Windows)
  is used when located next to the projects ``matrix.json``.

**Example matrix override:**

A part of ``cmake/projects/Boost/ci/matrix.json``:

.. code-block:: json

    [
    { "example": "Boost",              "toolchain": "clang-cxx17",              "os": "ubuntu-24.04" },
    { "example": "Boost-python",       "toolchain": "gcc-13-cxx17",             "os": "ubuntu-24.04", "script": "build.sh" },
    { "example": "Boost-python-numpy", "toolchain": "gcc-13-cxx17",             "os": "ubuntu-24.04", "python": "3.12", "script": "build-add-virtualenv.sh" },
    { "example": "Boost",              "toolchain": "vs-17-2022-win64-cxx17",   "os": "windows-2022" },
    { "example": "Boost-python",       "toolchain": "vs-17-2022-win64-sdk-10",  "os": "windows-2022" },
    { "example": "Boost-python-numpy", "toolchain": "vs-17-2022-win64-sdk-10",  "os": "windows-2022", "python": "3.12", "script": "build-add-virtualenv.cmd" }
    ]

Build scripts
^^^^^^^^^^^^^

Scripts are executed in the Hunter's root directory.

`Software installed on GitHub-hosted runners <https://docs.github.com/en/actions/reference/software-installed-on-github-hosted-runners>`__

Environment variables:

* **TOOLCHAIN** - build matrix's **toolchain** parameter
* **PROJECT_DIR** - **example** parameter
* **SCRIPT** - full path to file defined by **script** parameter, called by ``build.py`` before build

Default build script for all runners is ``.github/workflows/ci/build.py`` (python script)

.. literalinclude:: ../../../.github/workflows/ci/build.py
  :language: PYTHON

**Examples of override build scripts:**

.. note::
  Set ``matrix.json`` job parameter according to the script name - f.e. **"script": "build-ubuntu.sh"**

for Ubuntu runner ``cmake/projects/<PACKAGE_NAME>/ci/build-ubuntu.sh``:

.. code-block:: bash

  export HUNTER_JOBS_NUMBER=1
  pip install virtualenv
  sudo apt-get install libgl1-mesa-dev

for macOS ``cmake/projects/<PACKAGE_NAME>/ci/build-macos.sh``

.. code-block:: bash

  export HUNTER_JOBS_NUMBER=1
  pip install virtualenv

for Windows ``cmake/projects/<PACKAGE_NAME>/ci/build.cmd``:

.. code-block:: batch

    set HUNTER_JOBS_NUMBER=1
    pip install virtualenv
