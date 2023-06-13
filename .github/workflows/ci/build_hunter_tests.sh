# Set the correct Python PATH
export PATH="${HUNTER_PYTHON_LOCATION}:${PATH}"

# Tune locations
export PATH="${PWD}/_ci/cmake/bin:${PATH}"

# we want to exit on the first error, and we want the run commands to be shown
set -ex

# Run build
cmake -S "${PROJECT_DIR}" -B build_hunter_test -DHUNTER_ENABLED=ON -DHUNTER_STATUS_DEBUG=ON
cmake --build build_hunter_test
