# DrQuine
A quine is a computer program which takes no input and produces a copy of its own source code as its only output.

## 3 Quines

### Colleen
Output and code source are identical.

```bash
$> ./Colleen > tmp ; diff Colleen.c tmp
$> echo $?
0
```

### Grace
Create another source file, source code of the 2 files are identical.

```bash
$> ./Grace ; diff Grace.c Grace_kid.c
$> echo $?
0
```

### Sully
Create as many children as the index in the source code of `Sully`. The source code of all children is identical, except for the index, unique for each.

```bash
$> ./Sully
$> ls -1 Sully*
Sully
Sully.c
Sully_0
Sully_0.c
Sully_1
Sully_1.c
Sully_2
Sully_2.c
Sully_3
Sully_3.c
Sully_4
Sully_4.c
Sully_5
Sully_5.c
$> diff Sully_0.c Sully_5.c
8c8
< int i = 0;
---
> int i = 5;
```

## Implementations

### C
```bash
make		# compile each program
make test	# run the tests for each
```

### ASM
```bash
make		# compile each program
make test	# run the tests for each
```

### Python
```bash
make		# run each program
make test	# run the tests for each
```

