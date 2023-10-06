.. spelling::

    ippicv
    OpenCV

.. index:: opencv_component ; ippicv

.. _pkg.ippicv:

ippicv
======

-  `Official <https://github.com/opencv/opencv_3rdparty/tree/ippicv/master>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/ippicv/CMakeLists.txt>`__
-  Available since `v0.14.12 <https://github.com/cpp-pm/hunter/releases/tag/v0.14.12>`__

.. code-block:: cmake

    hunter_add_package(ippicv)
    file(GLOB ippicv_archive "${IPPICV_ROOT}/ippicv_*")
    if(EXISTS "${ippicv_archive}")
      message("ippicv archive: ${ippicv_archive}")
    else()
      message(FATAL_ERROR "Nothing found in `${IPPICV_ROOT}`")
    endif()

ippicv stands for Intel(R) Integrated Performance Primitives for OpenCV.
The package was added to be used by the OpenCV project and should be updated together with OpenCV.
