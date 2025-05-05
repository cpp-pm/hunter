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
    # disabled zip creation, see below
    # parser.add_argument(
    #     "--nocreate",
    #     action="store_true",
    #     help="Do not create Hunter archive (reusing old)",
    # )
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

    env_branch_name = os.getenv("BRANCH_NAME")
    if env_branch_name:
        password = os.getenv("GITHUB_USER_PASSWORD")
        if env_branch_name in ["master", "main"] and password:
            print(
                f"branch name is '{env_branch_name}' and GITHUB_USER_PASSWORD is set, uploading"
            )
            parsed_args.upload = True

    toolchain = os.getenv("TOOLCHAIN")
    if not toolchain:
        raise RuntimeError("Environment variable TOOLCHAIN is empty")
    if toolchain == "hunter_tests":
        # no toolchain for hunter_tests, but verbose config
        toolchain = None
        verbose = True
    else:
        # relative of full path to toolchain file? Just use it
        if pathlib.Path(toolchain).exists():
            toolchain = pathlib.Path(toolchain).absolute()
        else:
            # search for toolchain if different dirs
            found = False
            for toolchain_dir in [
                cdir / ".github" / "toolchains",  # directory created by set_matrix.py
                cdir / "toolchains",  # .github downloads artifact directly to root
            ]:
                if (toolchain_dir / f"{toolchain}.cmake").exists():
                    toolchain = toolchain_dir / f"{toolchain}.cmake"
                    found = True
            if not found:
                raise RuntimeError(
                    f"Environment variable TOOLCHAIN specified but specified TOOLCHAIN file not found: {toolchain}",
                )
    if toolchain is not None and not toolchain.exists():
        raise RuntimeError(
            f"Environment variable TOOLCHAIN specified but specified file not found: {toolchain}",
        )

    env_script = os.getenv("SCRIPT")
    if env_script:
        print(f"running specified SCRIPT before build: {env_script}")
        subprocess.check_call(env_script)

    project_dir = cdir / project_dir

    testing_dir = cdir / "_testing"
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

    # disable zip creation as it somehow breaks Windows 10 Store builds
    # examples/Eigen breaks with the message "Can't link to standard math library"
    # no clue why, but PRs are welcome if the zip creation is needed for something
    # hunter_url = testing_dir / "hunter.tar.gz"
    # if parsed_args.nocreate:
    #     if not os.path.exists(hunter_url):
    #         raise RuntimeError("Option `--nocreate` but no archive")
    # else:
    #     arch = tarfile.open(hunter_url, "w:gz")
    #     arch.add("cmake")
    #     arch.add("scripts")
    #     arch.close()

    # hunter_sha1 = hashlib.sha1(open(hunter_url, "rb").read()).hexdigest()

    # hunter_root = testing_dir / "Hunter"

    if parsed_args.clear_except_download:
        clear_except_download(hunter_root)

    print("Testing in: {}".format(testing_dir))
    build_dir = testing_dir / "build"
    if build_dir.exists():
        shutil.rmtree(build_dir)

    args = [
        parsed_args.cmake_exe,
        "-S",
        project_dir.as_posix(),
        "-B",
        build_dir.as_posix(),
        "-DHUNTER_SUPPRESS_LIST_OF_FILES=ON",
        "-DHUNTER_CONFIGURATION_TYPES=Release",
        "-DCMAKE_BUILD_TYPE=Release",
    ]
    if toolchain:
        args += [f"-DCMAKE_TOOLCHAIN_FILE={toolchain.as_posix()}"]
    # disabled zip creation, see above
    # args += [
    #    f"-DHUNTER_ROOT={hunter_root.as_posix()}",
    #    f"-DTESTING_URL={hunter_url.as_posix()}",
    #    f"-DTESTING_SHA1={hunter_sha1}",
    # ]

    # disabled zip creation, see above
    # if not parsed_args.nocreate:
    #     args += ["-DHUNTER_RUN_INSTALL=ON"]

    if parsed_args.disable_builds:
        args += ["-DHUNTER_DISABLE_BUILDS=ON"]

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
            "-DHUNTER_DISABLE_BUILDS=ON",
            "-DHUNTER_USE_CACHE_SERVERS=ONLY",
            "-DHUNTER_CONFIGURATION_TYPES=Release",
            "-DCMAKE_BUILD_TYPE=Release",
            "-DHUNTER_SUPPRESS_LIST_OF_FILES=ON",
        ]
        if toolchain:
            args += [f"-DCMAKE_TOOLCHAIN_FILE={toolchain.as_posix()}"]

        # disabled zip creation, see above
        # args += [
        #    f"-DHUNTER_ROOT={hunter_root.as_posix()}",
        #    f"-DTESTING_URL={hunter_url.as_posix()}",
        #    f"-DTESTING_SHA1={hunter_sha1}",
        # ]
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
