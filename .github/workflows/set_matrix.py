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


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--projects",
        help="space separated list of projects to process, used for local debugging",
        type=str,
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
    if not projects_dir.is_dir():
        raise RuntimeError(f"missing projects dir expected to be at {projects_dir}")

    projects = set()
    run_hunter_tests: bool = False
    if args.projects:
        for project in set(args.projects.split(" ")):
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

        include = []
        for project in projects:
            project_dir = projects_dir / project / "ci"

            matrix_override = project_dir / "matrix.json"
            if os.path.isfile(matrix_override):
                project_matrix = json_from_file_ignore_comments(matrix_override)
            else:
                project_matrix = [dict(leg, example=project) for leg in default_matrix]

            for leg in project_matrix:
                if os.path.isfile(project_dir / leg["script"]):
                    leg["script"] = (project_dir / leg["script"]).as_posix()
                else:
                    leg["script"] = (dafault_dir / leg["script"]).as_posix()

            include += project_matrix

        if run_hunter_tests:
            hunter_tests_matrix = json_from_file_ignore_comments(
                dafault_dir / "matrix_hunter_tests.json"
            )
            for leg in hunter_tests_matrix:
                leg["script"] = (dafault_dir / leg["script"]).as_posix()
            include += hunter_tests_matrix

        json_output = {"include": include}
        if args.output:
            with open(args.output, "w", encoding="utf-8") as f:
                json.dump(json_output, f, indent=2)
        else:
            print(json.dumps(json_output, indent=2))
    else:
        print("No projects found")
        return 1


if __name__ == "__main__":
    sys.exit(main())
