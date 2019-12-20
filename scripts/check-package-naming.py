#!/usr/bin/env python3

# Copyright (c) 2019, Rahul Sheth
# All rights reserved.

import argparse
import os
import re
import shutil
import tempfile

import git

# Returns False if there was an error.
def checkPackageName(queriedPackageName, performFix=False):
  if not queriedPackageName:
    print("You must specify a package name for this script to work!")
    return False

  packageVerified = True
  properPackageName = queriedPackageName
  fixDirectory = False
  # Check this way for case-sensitivity even on case-insensitive filesystems.
  if not queriedPackageName in os.listdir('cmake/projects/'):
    packageVerified = False
    if os.path.isfile('cmake/projects/'+queriedPackageName):
      print("ERROR: CMake project directory at cmake/projects/" + queriedPackageName + " has mismatching case!")
      fixDirectory = True
    else:
      print("ERROR: CMake project directory at cmake/projects/" + queriedPackageName + " does not exist!")

  packageHunterFile = os.path.join('cmake', 'projects', queriedPackageName, 'hunter.cmake')
  # NOTE: This can pass with an error in case-sensitivity on the parent directory.
  if not os.path.isfile(packageHunterFile):
    packageVerified = False
    print("ERROR: CMake project hunter.cmake file at " + packageHunterFile + " does not exist!")
  else:
    packageHunterRegex = r'PACKAGE_NAME\s*([0-9A-Za-z\-_\+\.]*)'
    with open(packageHunterFile, 'r') as hunterFile:
      hunterFileContents = hunterFile.read()
      searchResults = re.findall(packageHunterRegex, hunterFileContents)
      if not searchResults:
        packageVerified = False
        print("ERROR: Could not find appropriate PACKAGE_NAME in " + packageHunterFile + "!")
      else:
        properPackageName = searchResults[0]
        for packageName in searchResults:
          if not packageName == queriedPackageName:
            packageVerified = False
            print("ERROR: CMake project hunter.cmake file at " + packageHunterFile + " has inconsistent package name, "
              + packageName + " vs. " + queriedPackageName + "!")
            fixDirectory = True

  packageExampleDir = ""
  exampleDirListing = os.listdir('examples/')
  if not queriedPackageName in exampleDirListing:
    packageVerified = False
    for i in range(len(exampleDirListing)):
      if queriedPackageName.casefold() == exampleDirListing[i].casefold():
        packageExampleDir = 'examples/'+exampleDirListing[i]
        print("ERROR: CMake example directory at examples/" + queriedPackageName + " has mismatching case!")
        break
    if not os.path.isdir(packageExampleDir):
      underscoreExampleDir = 'examples/'+queriedPackageName.replace('-', '_')
      if os.path.isdir(underscoreExampleDir):
        packageExampleDir = underscoreExampleDir
        print("ERROR: CMake example directory at examples/" + queriedPackageName + " has underscores instead of hyphens!")
      else:
        packageExampleDir = None
        print("ERROR: CMake example directory at examples/" + queriedPackageName + " does not exist!")

  packageDocFile = ""
  docDirListing = os.listdir('docs/packages/pkg')
  if not queriedPackageName+".rst" in docDirListing:
    packageVerified = False
    for i in range(len(docDirListing)):
      if str(queriedPackageName+".rst").casefold() == docDirListing[i].casefold():
        packageDocFile = 'docs/packages/pkg/'+docDirListing[i]
        print("ERROR: Documentation file " + packageDocFile + " has mismatching case!")
        break
    if not os.path.isfile(packageDocFile):
      packageDocFile = None
      print("ERROR: Documentation file " + packageDocFile + " does not exist!")

  # NOTE: This can pass with an error in case-sensitivity on the parent directory.
  if packageDocFile and os.path.isfile(packageDocFile):
    packageDocRegex = r'\.\.\ _pkg.([0-9A-Za-z\-_\+\.]*)\:\s*(\1)\s*='
    with open(packageDocFile, 'r') as docFile:
      docFileContents = docFile.read()
      searchResults = re.findall(packageDocRegex, docFileContents)
      if not searchResults:
        packageVerified = False
        print("ERROR: Could not find appropriate package name string in " + packageDocFile + "!")
      else:
        for packageTuple in searchResults:
          for packageName in packageTuple:
            if not packageName == properPackageName:
              packageVerified = False
              print("ERROR: Documentation file docs/packages/pkg/" + queriedPackageName + " has inconsistent package name, "
                + packageName + " vs. " + properPackageName + "!")

  if packageVerified == False and performFix == True:
    print("Errors were detected and automatic fixing was requested. Attempting to fix...")
    # Initialize the git repo
    repo = git.Repo(os.getcwd())
    assert not repo.bare
    index = repo.index
    # Moving to a temporary file/directory and back can fix case-sensitive naming issues on case-insensitive file systems.
    # Fix the project directory name.
    tempName = "project123456"
    if fixDirectory:
      print("Moving %s to %s" % ('cmake/projects/'+queriedPackageName, 'cmake/projects/'+properPackageName))
      index.move(['cmake/projects/'+queriedPackageName, 'cmake/projects/'+tempName])
      index.commit('Moving cmake/projects/'+queriedPackageName+' to cmake/projects/'+tempName)
      index.move(['cmake/projects/'+tempName, 'cmake/projects/'+properPackageName])
      index.commit('Moving cmake/projects/'+tempName+' to cmake/projects/'+properPackageName)
    # Fix the example directory name.
    if packageExampleDir:
      index.move([packageExampleDir, 'examples/'+tempName])
      index.commit('Moving '+packageExampleDir+' to examples/'+tempName)
      index.move(['examples/'+tempName, 'examples/'+properPackageName])
      index.commit('Moving examples/'+tempName+' to examples/'+properPackageName)
    # Fix the docs file name.
    if packageDocFile:
      docsFileName = properPackageName+".rst"
      index.move([packageDocFile, 'docs/packages/pkg/'+tempName])
      index.commit('Moving '+packageDocFile+' to docs/packages/pkg/'+tempName)
      index.move(['docs/packages/pkg/'+tempName, 'docs/packages/pkg/'+docsFileName])
      index.commit('Moving docs/packages/pkg/'+tempName+' to docs/packages/pkg/'+docsFileName)
      # Fix the docs file.
      docsFilePath = 'docs/packages/pkg/'+properPackageName+".rst"
      docsFileOrigRegex = queriedPackageName+r'(?!>)'
      docsFile = open(docsFilePath, 'r')
      docsFileContents = docsFile.read()
      docsFile.close()
      docsFile = open(docsFilePath, 'w')
      re.sub(docsFileOrigRegex, properPackageName, docsFileContents)
      docsFile.write(docsFileContents)
      docsFile.close()
    # Try verifying again. Don't try to fix again to avoid infinite loops, just in case.
    return checkPackageName(queriedPackageName, False)

  return packageVerified

if __name__ == "__main__":
    argparser = argparse.ArgumentParser(
        description="""
            Verifies that the package name across cmake/projects/<NAME>,
            cmake/projects/<NAME>/hunter.cmake, examples/<NAME>, and docs/packages/pkg/<NAME> are consistent.
            Run from the root of the hunter directory.
        """
    )

    argparser.add_argument(
        '--package',
        help="""
            Name of package to check.
        """
    )

    argparser.add_argument(
        '--check_all',
        action='store_true',
        help="""
            Check all packages in cmake/projects/ folder.
        """
    )

    argparser.add_argument(
        '--fix',
        action='store_true',
        help="""
            Remedy package naming problems.
        """
    )
    argparser.set_defaults(check_all=False, fix=False)

    args = argparser.parse_args()

    if(args.check_all):
      for package in os.listdir('cmake/projects/'):
        print("Checking package " + package + "...")
        checkPackageName(package, args.fix)
    else:
      checkPackageName(args.package, args.fix)
