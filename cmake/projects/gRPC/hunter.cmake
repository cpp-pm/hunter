# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.6.6"
    URL "https://github.com/hunter-packages/grpc/archive/v1.6.6-p7.tar.gz"
    SHA1 "4658a5f88aad19dc8105a8662db616837bacb6cd")

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.8.1"
    URL "https://github.com/hunter-packages/grpc/archive/v1.8.1-p0.tar.gz"
    SHA1 "d38c4895a689b394bebdb8a4960a616d850b62b8")

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.9.1-p0"
    URL "https://github.com/hunter-packages/grpc/archive/v1.9.1-p0.tar.gz"
    SHA1 "ecde82be350f51b2f41bdd5378f92513b3ebccc1")

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.12.1-p0"
    URL "https://github.com/hunter-packages/grpc/archive/v1.12.1-p0.tar.gz"
    SHA1 "cee253f1a9075afe7eb8061a2783f50368ff3495")

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.17.2-p0"
    URL "https://github.com/hunter-packages/grpc/archive/v1.17.2-p0.tar.gz"
    SHA1 "7eb5711cc4fbc7a33563121b1a6921eac0a863ef")

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.31.0-p0"
    URL "https://github.com/cpp-pm/grpc/archive/v1.31.0-p0.tar.gz"
    SHA1 "017f1bbb1df948422b4e4894f1fcdaf7c120bc6e")

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.34.0-p0"
    URL "https://github.com/cpp-pm/grpc/archive/v1.34.0-p0.tar.gz"
    SHA1 "437f34aaf0ae699fc95cfddef16eabb9e2e8ed04")

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.43.2-p0"
    URL "https://github.com/cpp-pm/grpc/archive/v1.43.2-p0.tar.gz"
    SHA1 "208b9d47ee87c6a35de202020e21510d40e8c1a4")

hunter_add_version(
    PACKAGE_NAME gRPC
    VERSION "1.44.0-p0"
    URL "https://github.com/cpp-pm/grpc/archive/refs/tags/v1.44.0-p0.tar.gz"
    SHA1 "9521efd87a6ea0ca1102bf6e5acff835eecf5841")

hunter_cmake_args(
   gRPC
   CMAKE_ARGS
        gRPC_ZLIB_PROVIDER=package
        gRPC_CARES_PROVIDER=package
        gRPC_RE2_PROVIDER=package
        gRPC_SSL_PROVIDER=package
        gRPC_PROTOBUF_PROVIDER=package
        gRPC_PROTOBUF_PACKAGE_TYPE=CONFIG
        gRPC_GFLAGS_PROVIDER=package
        gRPC_BENCHMARK_PROVIDER=package
        gRPC_ABSL_PROVIDER=package
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(gRPC)
hunter_download(PACKAGE_NAME gRPC)
