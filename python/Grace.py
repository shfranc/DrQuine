code = "code = {!r}\nwith open('Grace_kid.py', 'w') as f:\n\tf.write(code.format(code))\n\tf.close()"
with open('Grace_kid.py', 'w') as f:
	f.write(code.format(code))
	f.close()