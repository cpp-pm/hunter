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

# Use Xcode 13.4 for macOS 12.x and iOS 15.x toolchains
if [[ "$TOOLCHAIN" =~ "osx-12" || "$TOOLCHAIN" =~ "ios-nocodesign-15" ]]; then
    export DEVELOPER_DIR="/Applications/Xcode_13.4.app/Contents/Developer"
fi

# Run build script
if [[ "$BRANCH_NAME" == "master" && ! -z "$GITHUB_USER_PASSWORD" ]]; then
    python jenkins.py --upload
else
    python jenkins.py
fi
