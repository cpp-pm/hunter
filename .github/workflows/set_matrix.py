#!/usr/bin/env python3
# # -*- coding: utf-8 -*-

import argparse
import json
import os
import pathlib
import re
import sys


# simple helper to allow single-line-comments with `//` in json files
# https://stackoverflow.com/a/57814048
def json_from_file_ignore_comments(filePath):
    contents = ""
    with open(filePath, "r") as fh:
        for line in fh:
            cleanedLine = line.split("//", 1)[0]
            if len(cleanedLine) > 0 and line.endswith("\n") and "\n" not in cleanedLine:
                cleanedLine += "\n"
            contents += cleanedLine
    json_data = json.loads(contents)
    return json_data


def create_toolchain(
    toolchains_dir: str | pathlib.Path, toolchain: str, project_name: str
):
    out = ""
    cc = ""
    cxx = ""

    parsed_toolchain = toolchain
    m = re.match(r"^(ninja|nmake)[-]?", toolchain)
    if m:
        parsed_toolchain = toolchain[m.end() :]
        out += f"""\
# Generator handled outside toolchain file: {m.groups(1)[0]}
"""

    m = re.match(r"^(gcc|clang|mingw|msys)(-[\d]+)?", toolchain)
    if m:
        parsed_toolchain = toolchain[m.end() :]
        if toolchain.startswith("clang"):
            cc = "clang"
            cxx = "clang++"
        elif toolchain.startswith("gcc"):
            cc = "gcc"
            cxx = "g++"
        elif toolchain.startswith(("mingw", "msys")):
            # generator handled outside of toolchain
            cc = "gcc"
            cxx = "g++"
            out += f"""\
# Generator handled outside toolchain file: {m.groups(1)[0]}
"""
        ext = m.group(2)
        if ext:
            cc += ext
            cxx += ext

    m = re.match(
        r"^android-ndk-api-([\d]+)-(armeabi|armeabi-v7a|arm64-v8a)", parsed_toolchain
    )
    if m:
        parsed_toolchain = parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
        # ANDROID_NDK provided by GitHub, just check if ANDROID_NDK variable is set
        # android_ndk_version = m.group(1)
        android_api = m.group(1)
        android_arch_abi = m.group(2)
        out += f"""\
set(CMAKE_SYSTEM_NAME "Android")
set(CMAKE_SYSTEM_VERSION "{android_api}") # API level
set(CMAKE_ANDROID_ARCH_ABI "{android_arch_abi}")
set(CMAKE_ANDROID_NDK "$ENV{{ANDROID_NDK}}") # provided by GitHub

string(COMPARE EQUAL "${{CMAKE_ANDROID_NDK}}" "" _is_empty)
if(_is_empty)
  message(FATAL_ERROR
      "Environment variable 'ANDROID_NDK' not set"
  )
endif()

# ANDROID macro is not defined by CMake 3.7+, however it is used by
# some packages like OpenCV
# (https://gitlab.kitware.com/cmake/cmake/merge_requests/62)
add_definitions("-DANDROID")
"""

    if "libcxx" in toolchain:
        # for android if we have libcxx in toolchain assume static runtime
        out += f"""\
set(CMAKE_ANDROID_STL_TYPE "c++_static") # LLVM libc++ static
"""

    m = re.match(r"^osx-([\d]+)-([\d]+)", parsed_toolchain)
    if m:
        parsed_toolchain = parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
        if not m.group(1) or not m.group(2):
            raise RuntimeError(
                f"project: {project_name}: error while parsing osx toolchain SDK verison: {toolchain}"
            )
        osx_sdk = f"{m.group(1)}.{m.group(2)}"
        out += f"""\
set(CMAKE_OSX_DEPLOYMENT_TARGET "{osx_sdk}" CACHE STRING "Minimum OS X deployment version" FORCE)
"""
        # always use clang and clang++ for xcode
        cc = "clang"
        cxx = "clang++"
        m = re.match(r"^-arch-universal2", parsed_toolchain)
        if m:
            parsed_toolchain = (
                parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
            )
            out += """\
set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64" CACHE STRING "OS X Target Architectures" FORCE)
"""

    m = re.match(r"^ios-nocodesign-([\d]+)-([\d]+)", parsed_toolchain)
    if m:
        parsed_toolchain = parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
        if not m.group(1) or not m.group(2):
            raise RuntimeError(
                f"project: {project_name}: error while parsing osx toolchain SDK verison: {toolchain}"
            )
        osx_sdk = f"{m.group(1)}.{m.group(2)}"
        out += f"""\
set(CMAKE_OSX_DEPLOYMENT_TARGET "{osx_sdk}" CACHE STRING "Minimum OS X deployment version" FORCE)
set(CMAKE_OSX_SYSROOT "iphoneos" CACHE STRING "System root for iOS" FORCE)
set(CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphoneos;-iphonesimulator")
"""
        # no code signing
        out += f"""\
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGNING_ALLOWED NO CACHE STRING "" FORCE)
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_ENTITLEMENTS "" CACHE STRING "" FORCE)
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGNING_REQUIRED NO CACHE STRING "" FORCE)
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "" CACHE STRING "" FORCE)
"""
        # always use clang and clang++ for xcode
        cc = "clang"
        cxx = "clang++"
        out += """\
set(CMAKE_MACOSX_BUNDLE YES)
"""
        m = re.match(r"^-arm64", parsed_toolchain)
        if m:
            parsed_toolchain = (
                parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
            )
            out += """\
set(IPHONEOS_ARCHS arm64)
set(IPHONESIMULATOR_ARCHS "")
"""

    m = re.match(r"^vs-([\d]+)-([\d]+)(-win64)?", parsed_toolchain)
    if m:
        parsed_toolchain = parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
        out += f"""\
# VS compiler selection handled toolchain file: {m.groups(0)}
"""
        cc = "cl"
        cxx = "cl"

        m = re.match(r"^-sdk(-[\d]+)+", parsed_toolchain)
        if m:
            parsed_toolchain = (
                parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
            )
            sdk_version_str = m.group(0).replace("-sdk-", "")
            sdk_version = sdk_version_str.replace("-", ".")
            out += f"""\
set(CMAKE_SYSTEM_VERSION {sdk_version})
"""

        m = re.match(r"^-store-10", parsed_toolchain)
        if m:
            parsed_toolchain = (
                parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
            )
            out += f"""\
set(CMAKE_SYSTEM_NAME WindowsStore)
set(CMAKE_SYSTEM_VERSION 10.0)
"""

    if cc:
        out += f"""\
set(CMAKE_C_COMPILER "{cc}" CACHE STRING "C compiler" FORCE)
"""
    if cxx:
        out += f"""\
set(CMAKE_CXX_COMPILER "{cxx}" CACHE STRING "C++ compiler" FORCE)
"""

    cxx_standard = None
    m = re.match(r"^-libcxx([\d]+)?", parsed_toolchain)
    if m:
        parsed_toolchain = parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
        out += """\
set(CMAKE_CXX_FLAGS_INIT "${CMAKE_CXX_FLAGS_INIT} -stdlib=libc++")
"""
        cxx_standard = m.group(1)

    m = re.match(r"^-cxx([\d]+)", parsed_toolchain)
    if m:
        parsed_toolchain = parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
        cxx_standard = m.group(1)

    if cxx_standard:
        out += f"set(CMAKE_CXX_STANDARD {cxx_standard})\n"
        out += f"set(CMAKE_CXX_STANDARD_REQUIRED ON)\n"
        out += f"set(CMAKE_CXX_EXTENSIONS OFF)\n"

    m = re.match(r"^-c([\d]+)", parsed_toolchain)
    if m:
        parsed_toolchain = parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
        c_standard = m.group(1)
        if not c_standard:
            raise RuntimeError(
                f"project: {project_name}: encountered unhandled '-c<number>' flag in toolchain: '{toolchain}'"
            )
        out += f"""\
set(CMAKE_C_STANDARD {c_standard})
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
# Hunter doesn't run toolchain-id calculation for C compiler
list(APPEND HUNTER_TOOLCHAIN_UNDETECTABLE_ID "c{c_standard}")
"""

    if parsed_toolchain.startswith("-fpic"):
        parsed_toolchain = parsed_toolchain[len("-fpic") :]
        out += """\
set(CMAKE_POSITION_INDEPENDENT_CODE TRUE CACHE BOOL "Position independent code" FORCE)

# Linux, GCC 7.3.0 same results with and without '-fPIC' flag for code:
#
#  #include <iostream>
#  int main() {
#  #if defined(__PIC__)
#    std::cout << "PIC: " << __PIC__ << std::endl;
#  #else
#    std::cout << "PIC not defined" << std::endl;
#  #endif
#  }
list(APPEND HUNTER_TOOLCHAIN_UNDETECTABLE_ID "pic")
"""
    if parsed_toolchain != "":
        raise RuntimeError(
            f"project: {project_name}: toolchain not handled completely: '{toolchain}': unparsed string: '{parsed_toolchain}'"
        )

    if out == "":
        raise RuntimeError(f"project: {project_name}: unhandled toolchain: {toolchain}")

    toolchain_file = toolchains_dir / (
        toolchain if toolchain.endswith(".cmake") else f"{toolchain}.cmake"
    )
    with open(toolchain_file, "w", encoding="utf-8") as f:
        f.write("# toolchain file generated by set_matrix.py, do not modify!\n")
        f.write(out)


def generator_and_runscript(leg: dict):
    toolchain = leg["toolchain"]
    project_name = leg["example"]

    generator = None

    parsed_toolchain = toolchain
    m = re.match(r"^(ninja|nmake|mingw|msys)[-]?", toolchain)
    if m:
        parsed_toolchain = parsed_toolchain[m.end() :]
        if m.group(1).startswith("ninja"):
            generator = "Ninja"
        elif m.group(1).startswith("nmake"):
            generator = "NMake Makefiles"
        elif m.group(1).startswith("mingw"):
            generator = "MinGW Makefiles"
        elif m.group(1).startswith("msys"):
            generator = "MSYS Makefiles"
        else:
            raise RuntimeError(
                f"project: {project_name}: unhandled generator: {m.group()} in toolchain: {toolchain}"
            )

    m = re.match(r"^vs-([\d]+)-([\d]+)(-win64)?", parsed_toolchain)
    if m:
        parsed_toolchain = parsed_toolchain[: m.start()] + parsed_toolchain[m.end() :]
        vs_version = m.group(1)
        vs_year = m.group(2)
        vs_win64 = True if m.group(3) else False
        generator_str = None
        if vs_version == "16":
            if vs_year != "2019":
                raise RuntimeError(
                    f"project: {project_name}: VS 16 expected to have year 2019"
                )
            # The Windows 2019 Actions runner image will begin deprecation on 2025-06-01 and will be fully unsupported by 2025-06-30
            # https://github.com/actions/runner-images/issues/12045
            generator_str = "Visual Studio 16 2019"
            VCVARSALL = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Enterprise\\Common7\\Tools\\VsDevCmd.bat"
        elif vs_version == "17":
            if vs_year != "2022":
                raise RuntimeError(
                    f"project: {project_name}: VS 17 expected to have year 2022"
                )
            generator_str = "Visual Studio 17 2022"
            VCVARSALL = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Enterprise\\Common7\\Tools\\VsDevCmd.bat"
        else:
            raise RuntimeError(
                f"project: {project_name}: unhandled vs-generator: {m.group()} in toolchain: {toolchain}"
            )
        if not generator and generator_str:
            generator = generator_str
        if vs_win64:
            VCVARSALL_ARGS = "-arch=amd64 -host_arch=amd64"
        else:
            VCVARSALL_ARGS = ""
        leg["VCVARSALL"] = VCVARSALL
        leg["VCVARSALL_ARGS"] = VCVARSALL_ARGS

    if generator:
        leg["generator"] = generator


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "projects",
        help="project names to process, used for local debugging",
        nargs="*",
    )
    parser.add_argument(
        "-o",
        "--output",
        help="specify file to write to, default write to stdout",
        type=str,
        default="",
    )
    args = parser.parse_args()

    repo_root = pathlib.Path(__file__).parent.parent.parent
    projects_dir = repo_root / "cmake" / "projects"
    toolchains_dir = repo_root / ".github" / "toolchains"
    if not projects_dir.is_dir():
        raise RuntimeError(f"missing projects dir expected to be at {projects_dir}")

    projects = set()
    run_hunter_tests: bool = False
    if args.projects:
        for project in args.projects:
            if project == "hunter_tests":
                run_hunter_tests = True
            else:
                if (projects_dir / project).is_dir():
                    projects.add(project)
                else:
                    raise RuntimeError(f"provided project doesn't exist: {project}")
    else:
        try:
            with open(os.environ.get("HOME") + "/files.json") as json_files:
                files = json.load(json_files)
        except IOError:
            raise RuntimeError("Can't read changed files from files.json")

        p = re.compile("cmake/projects/([^/]+)")
        for file in files:
            if p.match(file):
                project = p.match(file).group(1)
                if (projects_dir / project).is_dir():
                    projects.add(project)
            if file.startswith("cmake/modules/"):
                run_hunter_tests = True
            if file.startswith("cmake/schemes/"):
                run_hunter_tests = True
            if file.startswith("cmake/templates/"):
                run_hunter_tests = True
            if file.startswith("tests/"):
                run_hunter_tests = True

    if projects or run_hunter_tests:
        dafault_dir = repo_root / ".github/workflows/ci"

        default_matrix = json_from_file_ignore_comments(dafault_dir / "matrix.json")

        if projects:
            toolchains_dir.mkdir(exist_ok=True)

        include = []
        for project in projects:
            project_dir = projects_dir / project / "ci"

            matrix_override = project_dir / "matrix.json"
            if matrix_override.is_file():
                project_matrix = json_from_file_ignore_comments(matrix_override)
            else:
                project_matrix = [dict(leg, example=project) for leg in default_matrix]

            for leg in project_matrix:
                leg["project"] = project
                if "script" in leg:
                    # script file provided, it MUST exist in project dir
                    proj_script_file = project_dir / leg["script"]
                    if not proj_script_file.is_file():
                        raise RuntimeError(
                            f"project: {project}: specified script file missing, expected path: {proj_script_file.as_posix()}"
                        )

                    leg["script"] = proj_script_file.relative_to(repo_root).as_posix()
                else:
                    # try to find os specific install script (build.sh/build.cmd)
                    if leg["os"].startswith(("ubuntu", "macos")):
                        proj_script_file = project_dir / "build.sh"
                        if proj_script_file.is_file():
                            leg["script"] = proj_script_file.relative_to(
                                repo_root
                            ).as_posix()
                    elif leg["os"].startswith("windows"):
                        proj_script_file = project_dir / "build.cmd"
                        if proj_script_file.is_file():
                            leg["script"] = proj_script_file.relative_to(
                                repo_root
                            ).as_posix()
                    else:
                        raise RuntimeError(
                            f"project: {project}: unhandled os: {leg['os']}"
                        )
                    if "script" not in leg:
                        # explicitly set empty script
                        leg["script"] = ""
                if not (repo_root / "examples" / project).is_dir():
                    raise RuntimeError(
                        f"project: {project}: missing examples/{project} dir"
                    )
                example_dir_entry = f"examples/{leg['example']}"
                example_dir = repo_root / example_dir_entry
                if not example_dir.is_dir():
                    raise RuntimeError(
                        f"project: {project}: missing {example_dir_entry} dir"
                    )
                leg["example"] = example_dir_entry
                leg["project"] = example_dir.name
                # create toolchain file
                create_toolchain(
                    toolchains_dir=toolchains_dir,
                    toolchain=leg["toolchain"],
                    project_name=project,
                )
                # handle vs-xx-xxxx/mingw/etc generator string
                generator_and_runscript(leg)

            include += project_matrix

        if run_hunter_tests:
            hunter_tests_matrix = json_from_file_ignore_comments(
                dafault_dir / "matrix_hunter_tests.json"
            )
            for leg in hunter_tests_matrix:
                leg["project"] = leg["example"]
                leg["script"] = ""
            include += hunter_tests_matrix

        for leg in include:
            if "python" not in leg:
                # default Python version to use
                leg["python"] = "3.12"

        json_output = {"include": include}
        if args.output:
            with open(args.output, "w", encoding="utf-8") as f:
                json.dump(json_output, f, indent=2)
        else:
            print(json.dumps(json_output))
    else:
        print("No projects found")
        return 1


if __name__ == "__main__":
    sys.exit(main())
