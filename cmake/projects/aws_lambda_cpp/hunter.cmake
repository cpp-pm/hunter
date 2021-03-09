# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME aws_lambda_cpp
    VERSION "v0.2.7-p0"
    URL "https://github.com/cpp-pm/aws-lambda-cpp/archive/refs/heads/hunter-v0.2.7.tar.gz"
    SHA1 8e84d81b3cd29acf5f618c942e7dc4ffc9ea325b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(aws_lambda_cpp)
hunter_download(PACKAGE_NAME aws_lambda_cpp)
