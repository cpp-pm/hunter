#!/bin/sh
# Install additional dependencies:

if [ "$(uname)" == "Darwin" ]; then
    # OSX
    :
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # GNU/Linux
    sudo apt-get update
    sudo apt-get install mesa-common-dev libgl1-mesa-dev libxmu-dev libxi-dev
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Windows x32
    :
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Windows x64
    :
fi
