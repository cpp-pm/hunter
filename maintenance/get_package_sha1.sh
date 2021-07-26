#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

PACKAGE_URL=$1

WGET_COMMAND=$("$SCRIPT_DIR/get_wget_command.sh")
SED_COMMAND=$("$SCRIPT_DIR/get_sed_command.sh")

$WGET_COMMAND $1 --quiet -O package.tar.gz
PACKAGE_SHA1=$(openssl sha1 package.tar.gz | $SED_COMMAND 's/^.* //')
rm package.tar.gz
echo "$PACKAGE_SHA1"
