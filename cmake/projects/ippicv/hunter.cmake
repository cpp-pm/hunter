# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# Version 20151201
if(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20151201"
      URL
      "https://raw.githubusercontent.com/Itseez/opencv_3rdparty/81a676001ca8075ada498583e4166079e5744668/ippicv/ippicv_macosx_20151201.tgz"
      SHA1
      d3f641c05708aaa2e0e91f2a10e34c80bc217cde
  )
elseif(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20151201"
      URL
      "https://raw.githubusercontent.com/Itseez/opencv_3rdparty/81a676001ca8075ada498583e4166079e5744668/ippicv/ippicv_linux_20151201.tgz"
      SHA1
      2252c08aa3107f8e4194263e668ccff8c6e3783a
  )
elseif(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20151201"
      URL
      "https://raw.githubusercontent.com/Itseez/opencv_3rdparty/81a676001ca8075ada498583e4166079e5744668/ippicv/ippicv_windows_20151201.zip"
      SHA1
      3e596c7d798028699ae0ea870902288088a51a6d
  )
endif()

# Version 20141027
if(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20141027"
      URL
      "http://sourceforge.net/projects/opencvlibrary/files/3rdparty/ippicv/ippicv_macosx_20141027.tgz"
      SHA1
      b020d2d10e01f5b8d95f148bda5af4e24e52a3d2
  )
elseif(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20141027"
      URL
      "http://sourceforge.net/projects/opencvlibrary/files/3rdparty/ippicv/ippicv_linux_20141027.tgz"
      SHA1
      64a39f85206c0da05880df364955729fbdefbac6
  )
elseif(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20141027"
      URL
      "http://sourceforge.net/projects/opencvlibrary/files/3rdparty/ippicv/ippicv_windows_20141027.zip"
      SHA1
      6722cb73ab815f61f103b87114d44d93f8f9d3ba
  )
endif()

# Version: 20230330
# added for OpenCV 4.8.1
if(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20230330"
      URL
      "https://raw.githubusercontent.com/opencv/opencv_3rdparty/1224f78da6684df04397ac0f40c961ed37f79ccb/ippicv/ippicv_2021.8_mac_intel64_20230330_general.tgz"
      SHA1
      abc8caf5d8819abfbe0b257c4d41d9cd32406ebb
  )
elseif(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20230330"
      URL
      "https://raw.githubusercontent.com/opencv/opencv_3rdparty/1224f78da6684df04397ac0f40c961ed37f79ccb/ippicv/ippicv_2021.8_lnx_intel64_20230330_general.tgz"
      SHA1
      80c96d62ca6b4596775da7c5dcc9602712328a61
  )
elseif(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20230330"
      URL
      "https://raw.githubusercontent.com/opencv/opencv_3rdparty/1224f78da6684df04397ac0f40c961ed37f79ccb/ippicv/ippicv_2021.8_win_intel64_20230330_general.zip"
      SHA1
      7c7f83e37caf6c342d76014f3eccedb47d559010
  )
endif()

# Version: 20240201
# added for OpenCV 4.10.0
if(APPLE)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20240201"
      URL
      "https://raw.githubusercontent.com/opencv/opencv_3rdparty/0cc4aa06bf2bef4b05d237c69a5a96b9cd0cb85a/ippicv/ippicv_2021.9.1_mac_intel64_20230919_general.tgz"
      SHA1
      b9b3e0775a1599d32cd8fed14e670c153ece4722
  )
elseif(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20240201"
      URL
      "https://raw.githubusercontent.com/opencv/opencv_3rdparty/fd27188235d85e552de31425e7ea0f53ba73ba53/ippicv/ippicv_2021.11.0_lnx_intel64_20240201_general.tgz"
      SHA1
      d4da464d3b5796bdcaafac85bddece601c708f41
  )
elseif(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20240201"
      URL
      "https://raw.githubusercontent.com/opencv/opencv_3rdparty/fd27188235d85e552de31425e7ea0f53ba73ba53/ippicv/ippicv_2021.11.0_win_intel64_20240201_general.zip"
      SHA1
      a15f378ccd01ebceb84ddd5fc0128f87a962fed6
  )
endif()

# Version: 20250130
# added for OpenCV 4.12.0
if(UNIX)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20250130"
      URL
      "https://raw.githubusercontent.com/opencv/opencv_3rdparty/767426b2a40a011eb2fa7f44c677c13e60e205ad/ippicv/ippicv_2022.1.0_lnx_intel64_20250130_general.tgz"
      SHA1
      b1465c256d32112c69e1104f734edc0b1d68d0db
  )
elseif(WIN32)
  hunter_add_version(
      PACKAGE_NAME
      ippicv
      VERSION
      "20250130"
      URL
      "https://raw.githubusercontent.com/opencv/opencv_3rdparty/767426b2a40a011eb2fa7f44c677c13e60e205ad/ippicv/ippicv_2022.1.0_win_intel64_20250130_general.zip"
      SHA1
      3c981e7bcd6fe586caba5915d4aa66f08e1db75e
  )
endif()

hunter_pick_scheme(DEFAULT url_sha1_download)
hunter_download(PACKAGE_NAME ippicv)
