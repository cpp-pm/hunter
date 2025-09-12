.. spelling:word-list::

    RapidJSON

.. index:: json ; RapidJSON

.. _pkg.RapidJSON:

RapidJSON
=========

-  http://rapidjson.org/
-  `GitHub official <https://github.com/miloyip/rapidjson>`__
-  `Hunterized <https://github.com/hunter-packages/rapidjson>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/rapidjson/condense.cpp>`__

.. code-block:: cmake

    hunter_add_package(RapidJSON)
    find_package(RapidJSON CONFIG REQUIRED)
    target_link_libraries(... RapidJSON::rapidjson)

Macros
------

RapidJSON defines a few macros to configure the library. If different libraries use different
settings, undefined behavior can occur. We set up the defines to be exported when set, and we
set the ``RAPIDJSON_HAS_STDSTRING=1`` and ``RAPIDJSON_NOMEMBERITERATORCLASS`` by default. These
can be overridden with a `custom config <https://github.com/cpp-pm/gate#usage-custom-config>`__

.. code-block:: cmake

  hunter_config(
      RapidJSON
      VERSION ${HUNTER_RapidJSON_VERSION}
      CMAKE_ARGS
        RAPIDJSON_HAS_STDSTRING=OFF
        RAPIDJSON_NOMEMBERITERATORCLASS=OFF
  )
