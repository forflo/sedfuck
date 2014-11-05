Sedfuck
=======

This little sed script "compiles" a given
brainfuck file to a runnable binary

Mandatory tools
---------------
Just GNU Sed and the GNU C compiler need to be
installed on the host platform.

Usage
-----

	$ sed -n -f sedfuck.sed < <infile>.bf > sedfuck.out.c
Compiles the given brainfuck code to C code and uses
the C compiler to produce a runnable objectfile called sedfuck.out.

Note that *you have to* redirect the output to the file
"sedfuck.out.c".

	$ sed -n -f sedfuck.sed < <infile>.bf
Transcompiles the given brainfuck code to C and puts it
to stdout.

C inlining
----------
### General
This C->Brainfuck "compiler" provides you with the
possibility to inline arbitrary C-Code. 

With sedfuck, the following longly awaited extremely productive
C code will finally be possible.

	+++++[ printf("PONIS!!\+\-\[\]\n"); - ]
	
Will produce

	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]

### Escaping of brainfuck symbols
As you can see, sedfuck handles the processing of brainfuck symbols properly. You only have
to prefix them with the "\" char. That's it.

### Accessing the brainfuck pointer

The brainfuck pointer can be accessed as follows

	+++[ printf("WATMAN?! #%d\n"\, *ptr); ]

Since the dynamic array ptr is accessible everywhere you could also
write something like this

	+++[ printf("WUT?"); ptr\[*ptr\] = 65;-]
	>>>.<.<.

![wat](wat.png)
