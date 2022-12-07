hunter_config(ceres-solver
  VERSION ${HUNTER_ceres-solver_VERSION} CMAKE_ARGS
    LAPACK=ON
    SUITESPARSE=ON
    CXSPARSE=ON # since 1.14.0-p1
    # sine 2.1.0, SuiteSparse 5.4.0 per default builds against OpenBLAS as well
    WITH_OPENBLAS=ON
)
