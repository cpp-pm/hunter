hunter_config(ceres-solver
  VERSION ${HUNTER_ceres-solver_VERSION} CMAKE_ARGS
    LAPACK=ON
    SUITESPARSE=ON
    CXSPARSE=OFF # since 1.14.0-p1
    WITH_OPENBLAS=OFF # we want to test generic LAPACK dynamic lib, not OpenBLAS
)
hunter_config(SuiteSparse
  VERSION ${HUNTER_SuiteSparse_VERSION}
  CMAKE_ARGS
  BUILD_METIS=ON
  WITH_OPENBLAS=OFF # we want to test generic LAPACK dynamic lib, not OpenBLAS
)
hunter_config(LAPACK
  VERSION ${HUNTER_LAPACK_VERSION}
  CMAKE_ARGS BUILD_SHARED_LIBS=ON
)
