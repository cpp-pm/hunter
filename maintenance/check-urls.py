#!/usr/bin/env python3
# # -*- coding: utf-8 -*-

import argparse
from glob import glob
import json
import pathlib
import os
from os.path import dirname, abspath, join
import re
import signal
import sys
import pycurl

# failed projects, global to print on early abort with Ctrl+C
failed_projects: dict[str, list[str]] = dict()


def print_failed_projects():
    if failed_projects:
        print("failed projects:")
        print(json.dumps(failed_projects, indent=2))
    else:
        print("all clear! No project with failing URL found")


def signal_handler(signal, frame):
    # force exit as pycurl.error after KeyboardInterrupt is caught
    # and then the next url is checked
    print("You pressed Ctrl+C!")
    print_failed_projects()
    sys.exit(1)


def getResponseStausCode(url):
    try:
        c = pycurl.Curl()
        c.setopt(pycurl.WRITEFUNCTION, lambda x: None)
        # c.setopt(pycurl.HEADERFUNCTION, lambda x: None)
        c.setopt(pycurl.URL, url)
        c.setopt(pycurl.HEADER, 1)
        c.setopt(pycurl.NOBODY, 1)
        c.setopt(pycurl.FOLLOWLOCATION, 1)
        c.perform()
        return c.getinfo(pycurl.HTTP_CODE)
    except pycurl.error:
        return 999


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
        help="specify file to write failed projects and URLs to, default write to stdout",
        type=str,
        default="",
    )
    args = parser.parse_args()

    repo_root = pathlib.Path(__file__).parent.parent
    projects_dir = repo_root / "cmake" / "projects"

    projects = set()
    if args.projects:
        if "all" in args.projects:
            print("project 'all' specified, checking all projects")
            project_hunter_files = projects_dir / "*" / "hunter.cmake"
            for hunter_file in glob(project_hunter_files.as_posix(), recursive=False):
                project = pathlib.Path(hunter_file).parent.name
                projects.add(project)
        else:
            for project in args.projects:
                if (projects_dir / project).is_dir():
                    projects.add(project)
                else:
                    raise RuntimeError(
                        f"provided project doesn't exist: {project}: expected dir: {projects_dir / project}"
                    )
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

    # override signal handler to make it possible to hard exit at Ctrl+C
    # and print a status if we've found a failing URL or not yet
    signal.signal(signal.SIGINT, signal_handler)

    for project in sorted(projects):
        print()
        print(f"checking project: {project}")
        hunter_file = projects_dir / project / "hunter.cmake"
        if not hunter_file.is_file():
            raise RuntimeError(f"hunter.cmake file not found: {hunter_file}")
        with open(hunter_file, "r", encoding="utf-8") as file:
            content = file.read()

        entries = re.findall(
            r'hunter_add_version\s*\(\s*PACKAGE_NAME\s+"*(.*?)"*\s+VERSION\s+"*(.*?)"*\s+URL\s+"*(.*?)"*\s+SHA1\s+"*(.*?)"*\s+.*?\)',
            content,
            re.MULTILINE | re.DOTALL,
        )
        if len(entries) == 0:
            raise RuntimeError(
                f"no URLs found for project '{project}' in file: {hunter_file}"
            )
        for name, version, url, _ in entries:
            status_code = getResponseStausCode(url)
            print(f"{status_code} {url}")
            if status_code > 200:
                if project not in failed_projects:
                    failed_projects[project] = []
                failed_projects[project].append(f"{status_code} {url}")
    print_failed_projects()
    if len(failed_projects) > 0 and args.output:
        with open(args.output, "w", encoding="utf-8") as file:
            json.dump(failed_projects, file, indent=2)
    return 0 if len(failed_projects) == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
