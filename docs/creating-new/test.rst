.. Copyright (c) 2020, Dmitry Rodin
.. All rights reserved.

Test package
============

Hunter uses `GitHub Actions <https://docs.github.com/en/actions>`__ for :ref:`continuous integration testing <ci testing>`.
You can also test :ref:`package building <testing locally>` and :ref:`documentation <testing documentation locally>` locally, however this is optional.

Testing will be performed automatically on pull request.
To perform testing on push to your Hunter fork, ensure that GitHub Actions are enabled for your repository -
`Managing GitHub Actions <https://docs.github.com/en/github/administering-a-repository/disabling-or-limiting-github-actions-for-a-repository#managing-github-actions-permissions-for-your-repository>`__.

Package build testing will be performed for multiple platforms (different toolchains).
If some toolchains are working and some toolchains failed it means the project has platform-specific problems.
Note that you don't have to have all toolchains working and there is **no need to fix all issues you see**.
If **at least documentation test is passing** and *some toolchain tests are working*
you can make a pull request and you or somebody else can apply fixes later.

If you're sure that testing is failing due to system specific requirements and
NOT due to package dependencies or platform specific code errors,
or your package contains components and needs to perform some special tests with different examples -
you can :ref:`modify default build matrix and scripts <override default tests>`.

.. toctree::
   :maxdepth: 1

   /creating-new/test/ci
   /creating-new/test/local
