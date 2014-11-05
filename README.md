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
