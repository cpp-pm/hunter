hunter_config(ceres-solver
  VERSION ${HUNTER_ceres-solver_VERSION} CMAKE_ARGS
    SUITESPARSE=ON
    # since 2.1.0, SuiteSparse 5.4.0 per default builds against OpenBLAS as well
    WITH_OPENBLAS=ON
)
