# Note: PYTHON_VERSION is optional. Refer to Boost package documentation on how
# and when to use it: https://cpp-pm-hunter.readthedocs.io/en/latest/packages/pkg/Boost.html#cmake-options
hunter_config(Boost VERSION ${HUNTER_Boost_VERSION} CMAKE_ARGS PYTHON_VERSION=${PYTHON_VERSION} HUNTER_ENABLE_BOOST_PYTHON_NUMPY=True)
hunter_config(hunter_venv VERSION ${HUNTER_hunter_venv_VERSION} CMAKE_ARGS HUNTER_VENV_PYTHON_VERSION=${PYTHON_VERSION})
