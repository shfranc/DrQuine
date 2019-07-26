import sys, os
i = 5
filename = 'Sully_' + str(i) + '.py'
code = """import sys, os
i = {0}
filename = 'Sully_' + str(i) + '.py'
code = {1}{2}{1}
def write_file(filename, i):
    try: f = open(filename, 'w') ; f.write(code.format(i, {1!r}, code)) ; f.close
    except OSError: sys.exit(1)
write_file(filename, i)
if i > 0:
    filename = 'Sully_' + str(i - 1) + '.py'
    write_file(filename, i - 1)
    os.system('python3 ' + filename)
"""
def write_file(filename, i):
    try: f = open(filename, 'w') ; f.write(code.format(i, '"""', code)) ; f.close
    except OSError: sys.exit(1)
write_file(filename, i)
if i > 0:
    filename = 'Sully_' + str(i - 1) + '.py'
    write_file(filename, i - 1)
    os.system('python3 ' + filename)
