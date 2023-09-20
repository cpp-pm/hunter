cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-jsoncpp)

hunter_add_package(jsoncpp)

find_package(jsoncpp CONFIG REQUIRED)

add_executable(version main.cpp)

if(${HUNTER_jsoncpp_VERSION} VERSION_LESS 1.0.0)
  target_link_libraries(version jsoncpp_lib)
else()
  if(${HUNTER_jsoncpp_VERSION} VERSION_LESS 1.9.5)
    target_link_libraries(version jsoncpp_lib_static)
  else()
    target_link_libraries(version JsonCpp::JsonCpp)
  endif()
endif()
