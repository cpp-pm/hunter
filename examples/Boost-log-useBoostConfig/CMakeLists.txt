cmake_minimum_required(VERSION 3.5)

set(Boost_DEBUG ON CACHE BOOLEAN "")
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS log)
find_package(Boost CONFIG REQUIRED log)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::log)
