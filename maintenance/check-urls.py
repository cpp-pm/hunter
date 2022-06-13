from os.path import dirname, abspath, join
from glob import glob
import re
import sys
import pycurl

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

hunterDir = dirname(dirname(abspath(__file__)))
projectsDir = join(hunterDir, 'cmake', 'projects')

project = ''
if len(sys.argv) > 1:
    project = sys.argv[1]

projectsFiles = join(projectsDir, project, '**', '*.cmake')

checkedFile = join(hunterDir, 'maintenance', 'checked.txt')
try:
    checkedStream = open(checkedFile, "r+")
    checked = checkedStream.readlines()
except FileNotFoundError:
    checkedStream = open(checkedFile, "w")
    checked = []

projects = dict()

for projectFile in glob(projectsFiles, recursive=True):
    with open(projectFile, "r") as file:
        content = file.read()

    entries = re.findall(r'hunter_add_version\s*\(\s*PACKAGE_NAME\s+"*(.*?)"*\s+VERSION\s+"*(.*?)"*\s+URL\s+"*(.*?)"*\s+SHA1\s+"*(.*?)"*\s+.*?\)', content, re.MULTILINE | re.DOTALL)
    if len(entries):
        for name, version, url, _ in entries:
            if not any(url == x.rstrip('\n') for x in checked):
                statusCode = getResponseStausCode(url)
                print(str(statusCode) + ' ' + url)
                if  statusCode > 200:
                    checkedStream.write(str(statusCode) + ' ' + url + '\n')
                
checkedStream.close()
