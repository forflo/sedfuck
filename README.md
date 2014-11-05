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

Special features
----------------
This C->Brainfuck "compiler" provides you with the
possibility to inline arbitrary C-Code. 

Ugly? No, very beautiful!

With sedfuck, the following longly awaited extremely productive
C code will finally be possible.

	+++++[ printf("PONIS!!\+\-\[\]\n"); - ]
	
Will produce

	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	
As you can see, sedfuck handles the processing of brainfuck symbols properly. You only have
to prefix them with the "\" char. That's it.

![wat](wat.png)
