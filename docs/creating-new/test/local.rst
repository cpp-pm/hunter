.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. _testing locally:

Testing locally
---------------

This step is optional since we will run tests on the CI server. However it's the
fastest way to check that everything is ready and working correctly.

Script ``jenkins.py`` will package a temporary Hunter archive based on current
state and build the specified example. This script uses
`Polly <https://github.com/cpp-pm/polly>`__ toolchains.

Check you have Python 3 installed, clone Polly, add its ``bin`` folder to
``PATH`` environment variable, go back to Hunter repository and run test.

On Linux:

.. code-block:: none

  > which python3
  /usr/bin/python3

  > git clone https://github.com/cpp-pm/polly
  > cd polly
  [polly]> export PATH="`pwd`/bin:$PATH"

  > cd hunter
  [hunter]> which polly.py
  /.../bin/polly.py

  [hunter]> polly.py --help
  Python version: 3.5
  usage: polly.py [-h]
  ...

  [hunter]> TOOLCHAIN=gcc PROJECT_DIR=examples/hunter_box_1 ./jenkins.py

On Windows:

.. code-block:: none

  > git clone https://github.com/cpp-pm/polly
  > cd polly
  [polly]> set PATH=%CD%\bin;%PATH%

  > cd hunter
  [hunter]> where polly.py
  C:\...\bin\polly.py

  [hunter]> polly.py --help
  Python version: 3.5
  usage: polly.py [-h]
  ...

  [hunter]> set TOOLCHAIN=vs-12-2013
  [hunter]> set PROJECT_DIR=examples\hunter_box_1
  [hunter]> .\jenkins.py

.. admonition:: Stackoverflow

  * `How to execute Python scripts in Windows? <https://stackoverflow.com/a/1936078/2288008>`__

.. _testing documentation locally:

Testing documentation locally
=============================

To locally check if the documentation is still building you can run:

.. code-block:: none

  [hunter]> cd docs
  [hunter/docs]> source ./jenkins.sh
  (_venv) [hunter/docs]> ./make.sh

If the documentation contains spelling errors or unrecognized names, the
documentation test build will fail and report the unrecognized strings. Fix
any spelling errors and test the build again. Any remaining errors can be
fixed by adding all correct but unrecognized names, string, or terms to the
``spelling`` header at the top of the document entry
``docs/packages/pkg/bar-baz.rst``. In this example,
``bar-baz`` would be a package name that is not in the dictionary.

.. code-block:: none
  :emphasize-lines: 1-4

  .. spelling:word-list::

    bar
    baz

  .. index::
    single: unsorted ; bar-baz

  .. _pkg.bar-baz:

Add entries for each term until the test build completes successfully.

Common mistake
^^^^^^^^^^^^^^

Please do not forget to substitute ``===``.

Good:

.. code-block:: none

  hunter_box_1
  ============

Bad:

.. code-block:: none

  hunter_box_1
  ===
