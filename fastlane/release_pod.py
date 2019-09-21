import os
import sys
from subprocess import call
import subprocess
import time


# Parsing args
# 1 - version

version = sys.argv[1]
print("version = ", version)

release_note = "Release "+version
print("release note = ", release_note)

# Generating new PodSpec File
call(["./podspec_generator.sh", version])
# Updating git and tagging for pod to fetch certain tag!
call(["git", "checkout", "master"])
call(["git", "commit", "-a", "-m",release_note])
call(["git", "push"])
# pushing Tag
call(["git", "tag", version])
call(["git", "push", "origin", version])
# Hack - Bitbucket sucks - take time after tagging until we can actually use the zip/tar file created
# Lets hope 600 (10 min) on avarage is enough (:
time.sleep(100)
# Publishing pod - hack need to pass current folder as well
command = "pod trunk push FGCKit.podspec --allow-warnings --verbose"
print("Runing Command - ", command)
process = subprocess.Popen(command,shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
for line in process.stdout:
    print(line)
status = process.wait()
# TODO error handling
if status is not 0:
	print("Error publishing pod")
print("DONE - ", release_note, "with code - ", process.returncode)
