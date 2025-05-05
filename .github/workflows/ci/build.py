#!/usr/bin/env python3

# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2025, NeroBurner
# All rights reserved.

import argparse
import hashlib
import os
import pathlib
import shutil
import subprocess
import sys
import tarfile
import tempfile
import time


def clear_except_download(hunter_root: pathlib.Path):
    base_dir = os.path.join(hunter_root, "_Base")
    if os.path.exists(base_dir):
        print("Clearing directory: {}".format(base_dir))
        hunter_download_dir = os.path.join(base_dir, "Download", "Hunter")
        if os.path.exists(hunter_download_dir):
            shutil.rmtree(hunter_download_dir)
        for filename in os.listdir(base_dir):
            if filename != "Download":
                to_remove = os.path.join(base_dir, filename)
                if os.name == "nt":
                    # Fix "path too long" error
                    subprocess.check_call(["cmd", "/c", "rmdir", to_remove, "/S", "/Q"])
                else:
                    shutil.rmtree(to_remove)


def run():
    parser = argparse.ArgumentParser("Testing script")
    parser.add_argument(
        "--nocreate",
        action="store_true",
        help="Do not create Hunter archive (reusing old)",
    )
    parser.add_argument(
        "--all-release",
        action="store_true",
        help="Release build type for all 3rd party packages",
    )
    parser.add_argument(
        "--clear",
        action="store_true",
        help="Remove old testing directories",
    )
    parser.add_argument(
        "--clear-except-download",
        action="store_true",
        help="Remove old testing directories except `Download` directory",
    )
    parser.add_argument(
        "--disable-builds",
        action="store_true",
        help="Disable building of package (useful for checking package can be loaded from cache)",
    )
    parser.add_argument(
        "--cmake-exe",
        help="specify cmake executable",
        default="cmake",
    )
    parser.add_argument(
        "--upload",
        action="store_true",
        help="Upload cache to server and run checks (clean up will be triggered, same as --clear-except-download)",
    )

    parsed_args = parser.parse_args()

    if parsed_args.upload:
        password = os.getenv("GITHUB_USER_PASSWORD")
        if password is None:
            raise RuntimeError(
                "Expected environment variable GITHUB_USER_PASSWORD on uploading"
            )

    cdir = pathlib.Path(os.getcwd())
    hunter_root = cdir

    toolchain = os.getenv("TOOLCHAIN")
    if not toolchain:
        raise RuntimeError("Environment variable TOOLCHAIN is empty")
    toolchain = cdir / toolchain

    project_dir = os.getenv("PROJECT_DIR")
    if not project_dir:
        raise RuntimeError("Expected environment variable PROJECT_DIR")

    verbose = False
    env_verbose = os.getenv("VERBOSE")
    if env_verbose:
        if env_verbose == "0":
            verbose = False
        elif env_verbose == "1":
            verbose = True
        else:
            raise RuntimeError(
                'Environment variable VERBOSE: expected 0 or 1, got "{}"'.format(
                    env_verbose
                )
            )

    project_dir = cdir / project_dir

    testing_dir = pathlib.Path(os.getcwd()) / "_testing"
    if testing_dir.exists() and parsed_args.clear:
        print(f"REMOVING: {testing_dir}")
        shutil.rmtree(testing_dir)
    testing_dir.mkdir(exist_ok=True)

    if os.name == "nt":
        # path too long workaround
        hunter_junctions = os.getenv("HUNTER_JUNCTIONS")
        if hunter_junctions:
            temp_dir = tempfile.mkdtemp(dir=hunter_junctions)
            shutil.rmtree(temp_dir)
            subprocess.check_output(
                "cmd /c mklink /J {} {}".format(temp_dir, testing_dir)
            )
            testing_dir = pathlib.Path(temp_dir)

    hunter_url = testing_dir / "hunter.tar.gz"

    if parsed_args.nocreate:
        if not os.path.exists(hunter_url):
            raise RuntimeError("Option `--nocreate` but no archive")
    else:
        arch = tarfile.open(hunter_url, "w:gz")
        arch.add("cmake")
        arch.add("scripts")
        arch.close()

    hunter_sha1 = hashlib.sha1(open(hunter_url, "rb").read()).hexdigest()

    hunter_root = testing_dir / "Hunter"

    if parsed_args.clear_except_download:
        clear_except_download(hunter_root)

    print("Testing in: {}".format(testing_dir))
    os.chdir(testing_dir)
    build_dir = testing_dir / "build"

    args = [
        parsed_args.cmake_exe,
        "-S",
        project_dir.as_posix(),
        "-B",
        build_dir.as_posix(),
        f"-DCMAKE_TOOLCHAIN_FILE={toolchain.as_posix()}",
        "-DCMAKE_POLICY_DEFAULT_CMP0069=NEW",
        "-DHUNTER_SUPPRESS_LIST_OF_FILES=ON",
        f"-DHUNTER_ROOT={hunter_root.as_posix()}",
        f"-DTESTING_URL={hunter_url.as_posix()}",
        f"-DTESTING_SHA1={hunter_sha1}",
    ]

    if not parsed_args.nocreate:
        args += ["-DHUNTER_RUN_INSTALL=ON"]

    if parsed_args.disable_builds:
        args += ["-DHUNTER_DISABLE_BUILDS=ON"]

    if parsed_args.all_release:
        args += ["-DHUNTER_CONFIGURATION_TYPES=Release"]

    if parsed_args.upload:
        passwords = cdir / "maintenance" / "upload-password-template.cmake"
        args += ["-DHUNTER_RUN_UPLOAD=ON"]
        args += [f"-DHUNTER_PASSWORDS_PATH={passwords}"]

    if verbose:
        args += ["-DCMAKE_VERBOSE_MAKEFILE=ON"]
        args += ["-DHUNTER_STATUS_DEBUG=ON"]

    print("Execute command: [")
    for i in args:
        if " " in i:
            print(f'  "{i}"')
        else:
            print(f"  {i}")
    print("]")

    subprocess.check_call(args)
    args_build = [
        parsed_args.cmake_exe,
        "--build",
        build_dir.as_posix(),
        "--config",
        "Release",
    ]
    print("Execute build command: [")
    for i in args_build:
        if " " in i:
            print(f'  "{i}"')
        else:
            print(f"  {i}")
    print("]")
    subprocess.check_call(args_build)

    cache_retry_count = 0
    max_cache_retry_count = 5

    if parsed_args.upload:
        seconds = 60
        print("Wait for GitHub changes became visible ({} seconds)...".format(seconds))
        time.sleep(seconds)

        print("Run sanity build")

        clear_except_download(hunter_root)

        # Sanity check - run build again with disabled building from sources
        args = [
            parsed_args.cmake_exe,
            "-S",
            project_dir.as_posix(),
            "-B",
            build_dir.as_posix(),
            f"-DCMAKE_TOOLCHAIN_FILE={toolchain.as_posix()}",
            "-DHUNTER_DISABLE_BUILDS=ON",
            "-DHUNTER_USE_CACHE_SERVERS=ONLY",
            "-DCMAKE_POLICY_DEFAULT_CMP0069=NEW",
            "-DHUNTER_SUPPRESS_LIST_OF_FILES=ON",
            f"-DHUNTER_ROOT={hunter_root.as_posix()}",
            f"-DTESTING_URL={hunter_url.as_posix()}",
            f"-DTESTING_SHA1={hunter_sha1}",
        ]
        if verbose:
            args += ["-DCMAKE_VERBOSE_MAKEFILE=ON"]
            args += ["-DHUNTER_STATUS_DEBUG=ON"]

        print("Execute command: [")
        for i in args:
            if " " in i:
                print(f'  "{i}"')
            else:
                print(f"  {i}")
        print("]")

        while subprocess.call(args) and cache_retry_count < max_cache_retry_count:
            print(f"Cache-only sanity check attempt {cache_retry_count} failed...")
            time.sleep(seconds)
            cache_retry_count += 1

        if cache_retry_count >= max_cache_retry_count:
            sys.exit(1)


if __name__ == "__main__":
    run()
