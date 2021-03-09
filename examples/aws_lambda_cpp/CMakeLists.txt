include("../common.cmake")
cmake_minimum_required(VERSION 3.19)

set(PROJECT_NAME example_aws_lambda_cpp)
project(${PROJECT_NAME})

# DOCUMENTATION_START {
hunter_add_package(aws_lambda_cpp)
find_package(aws-lambda-runtime CONFIG REQUIRED)
add_executable(${PROJECT_NAME} ./handler.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE AWS::aws-lambda-runtime)
aws_lambda_package_target(${PROJECT_NAME})
# DOCUMENTATION_END }

