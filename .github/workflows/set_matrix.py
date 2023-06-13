import os
import sys
import json
import re

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

try:
  with open(os.environ.get('HOME') + '/files.json') as json_files:
    files = json.load(json_files)
except IOError:
  sys.exit('Can\'t read changed files from files.json')

projects = set()
run_hunter_tests : bool = False

p = re.compile('cmake/projects/([^/]+)')
for file in files:
  if p.match(file):
    project = p.match(file).group(1)
    if os.path.isdir('cmake/projects/' + project):
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
  dafault_dir = '.github/workflows/ci/'

  default_matrix = json_from_file_ignore_comments(dafault_dir + 'matrix.json')

  include = []
  for project in projects:
    project_dir = 'cmake/projects/' + project + '/ci/';

    matrix_override = project_dir + 'matrix.json';
    if os.path.isfile(matrix_override):
      project_matrix = json_from_file_ignore_comments(matrix_override)
    else:
      project_matrix = [ dict(leg, example = project) for leg in default_matrix ]

    for leg in project_matrix:
      if (os.path.isfile(project_dir + leg['script'])):
        leg['script'] = project_dir + leg['script']
      else:
        leg['script'] = dafault_dir + leg['script']

    include += project_matrix

  if run_hunter_tests:
    hunter_tests_matrix = json_from_file_ignore_comments(dafault_dir + 'matrix_hunter_tests.json')
    for leg in hunter_tests_matrix:
      leg['script'] = dafault_dir + leg['script']
    include += hunter_tests_matrix

  print(json.dumps({'include': include}))
else:
  sys.exit('No projects found')