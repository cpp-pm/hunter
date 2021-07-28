# Set the correct Python PATH
export PATH="${HUNTER_PYTHON_LOCATION}:${PATH}"

# Install Python package 'requests'
python -m pip install --upgrade pip
python -m pip install requests gitpython

# Install latest Polly toolchains and scripts
wget https://github.com/cpp-pm/polly/archive/master.zip
unzip master.zip
POLLY_ROOT="`pwd`/polly-master"
export PATH="${POLLY_ROOT}/bin:${PATH}"

# Install dependencies (CMake, Android NDK)
install-ci-dependencies.py --prune-archives

# Tune locations
export PATH="`pwd`/_ci/cmake/bin:${PATH}"

# Installed if toolchain is Android (otherwise directory doesn't exist)
export ANDROID_NDK_r10e="`pwd`/_ci/android-ndk-r10e"
export ANDROID_NDK_r11c="`pwd`/_ci/android-ndk-r11c"
export ANDROID_NDK_r15c="`pwd`/_ci/android-ndk-r15c"
export ANDROID_NDK_r16b="`pwd`/_ci/android-ndk-r16b"
export ANDROID_NDK_r17="`pwd`/_ci/android-ndk-r17"

# Use Xcode 11.3.1 instead of default 11.6 (for ios-13-2 toolchain, no iOS 13.2 SDK in Xcode 11.6)
if [[ "$TOOLCHAIN" =~ "ios-nocodesign-13-2" ]]; then
    export DEVELOPER_DIR="/Applications/Xcode_11.3.1.app/Contents/Developer"
fi

# Use Xcode 12.2 instead of default 12.4 (no macOS 11.0 SDK in Xcode 12.4)
if [[ "$TOOLCHAIN" =~ "osx-11-0" ]]; then
    export DEVELOPER_DIR="/Applications/Xcode_12.2.app/Contents/Developer"
fi

# Run build script
if [[ "$BRANCH_NAME" == "master" && ! -z "$GITHUB_USER_PASSWORD" ]]; then
    python jenkins.py --upload
else
    python jenkins.py
fi
