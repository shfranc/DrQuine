import sys
code = "import sys\ncode = {!r}\ntry:\n    with open('Grace_kid.py', 'w') as f:\n        f.write(code.format(code))\n        f.close()\nexcept:\n    sys.exit()"
try:
    with open('Grace_kid.py', 'w') as f:
        f.write(code.format(code))
        f.close()
except:
    sys.exit()