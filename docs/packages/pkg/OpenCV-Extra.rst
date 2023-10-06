.. spelling::

    OpenCV-Extra

.. index:: opencv_component ; OpenCV-Extra

.. _pkg.OpenCV-Extra:

OpenCV-Extra
============

-  `Official <https://github.com/opencv/opencv_contrib>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/OpenCV-Extra/CMakeLists.txt>`__
-  Available since `v0.11.1 <https://github.com/cpp-pm/hunter/releases/tag/v0.11.1>`__
-  Added by `Ruslan Baratov <https://github.com/ruslo>`__ (`commit c0bb8aac <https://github.com/cpp-pm/hunter/commit/c0bb8aacac3ae8bc4f63a294e3dbf0ede0b7c785>`__)

Enabled by setting the flag ``OPENCV_WITH_EXTRA_MODULES=YES`` in the projects ``config.cmake`` file.

.. code-block:: cmake

    hunter_config(OpenCV
        VERSION ${HUNTER_OpenCV_VERSION}
        CMAKE_ARGS
            OPENCV_WITH_EXTRA_MODULES=YES
    )
