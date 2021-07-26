#!/bin/bash

if [[ "$OSTYPE" == "msys"* ]]; then
    WGET_COMMAND=winpty\ wget
else
    WGET_COMMAND=wget
fi

echo $WGET_COMMAND
