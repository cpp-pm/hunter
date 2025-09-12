.. Copyright (c) 2017, Ruslan Baratov
.. All rights reserved.

.. spelling:word-list::

  diff

Update package
--------------

.. note::

  If package lives in https://github.com/hunter-packages, it should be
  released there first. Check :doc:`Patch sources </creating-new/patch>`
  section.

Create branch for working on package update:

.. code-block:: none

  [hunter]> git checkout master
  [hunter]> git checkout -b pr.hunter_box_1

Calculate SHA1 of release:

.. code-block:: none

  > wget https://github.com/hunterbox/hunter_box_1/archive/v1.0.1.tar.gz
  > openssl sha1 v1.0.1.tar.gz
  SHA1(v1.0.1.tar.gz)= 10d046eec6c8b0aabd28bd3d1b99faf6beeb226b

Add URL and SHA1 to corresponding ``hunter.cmake``:

.. literalinclude:: hunter-NEW.cmake
  :diff: hunter.cmake

.. hint::

  Put new ``hunter_add_version`` at the bottom of file, diff will look
  prettier in this case.

Update default version in ``cmake/configs/default.cmake``:

.. literalinclude:: default-NEW.cmake
  :diff: default.cmake

Commit changes:

.. code-block:: none

  [hunter]> git add cmake/projects/hunter_box_1/hunter.cmake
  [hunter]> git add cmake/configs/default.cmake
  [hunter]> git commit -m "Update 'hunter_box_1' to v1.0.1"

.. include:: test.rst
  :end-before: toctree

Submit the pull request to Hunter
=================================

Once tests are passing, the package update in ``pr.hunter_box_1`` should be pushed to your Hunter fork:

.. code-block:: none

    [hunter]> git push -u origin pr.hunter_box_1

Finally, a pull request should be opened to send the package update to the main Hunter repository, as illustrated in the previous section pull request `screen shot <https://hunter.readthedocs.io/en/latest/creating-new/create/cmake.html#pull-requests>`__ (see `example <https://github.com/ruslo/hunter/pull/1893>`__).
