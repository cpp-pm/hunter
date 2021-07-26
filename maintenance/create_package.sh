#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

PACKAGE_NAME=$1
PACKAGE_VERSION=$2
PACKAGE_URL=$3

echo "Creating package files for $PACKAGE_NAME"

PACKAGE_SHA1=$($SCRIPT_DIR/get_package_sha1.sh $3)
SED_COMMAND=$($SCRIPT_DIR/get_sed_command.sh)

cp -r cmake/projects/foo cmake/projects/$PACKAGE_NAME
$SED_COMMAND -i "s,foo,$PACKAGE_NAME,g" cmake/projects/$PACKAGE_NAME/hunter.cmake
$SED_COMMAND -i "s,\"https.*\",\"$PACKAGE_URL\",g" cmake/projects/$PACKAGE_NAME/hunter.cmake
$SED_COMMAND -i "s,[1]\{40\},$PACKAGE_SHA1,g" cmake/projects/$PACKAGE_NAME/hunter.cmake
$SED_COMMAND -i "s,1\.0\.0,$PACKAGE_VERSION,g" cmake/projects/$PACKAGE_NAME/hunter.cmake

cp -r examples/foo examples/$PACKAGE_NAME
$SED_COMMAND -i "s,foo,$PACKAGE_NAME,g" examples/$PACKAGE_NAME/*

cp -r docs/packages/pkg/foo.rst docs/packages/pkg/$PACKAGE_NAME.rst
$SED_COMMAND -i "s,foo,$PACKAGE_NAME,g" docs/packages/pkg/$PACKAGE_NAME.rst
