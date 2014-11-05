Sedfuck
=======

This little sed script translates a given
brainfuck file to a runnable binary

Dependencies
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

	$ ./sedfuck.sed < [...]
is also supported (GNU/Linux only)

C inlining
----------
### General
This C->Brainfuck "compiler" provides you with the
possibility to inline arbitrary C-Code. 

#### Simple example
With sedfuck, the following longly awaited extremely productive
C code will finally be possible.

	+++++[ printf("PENUS!!\+\-\[\]\n"); - ]
	
Will produce

	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	
#### More complex example:

	+++++[ printf("PENUS!!\+\-\[\]\n");- ]
	printf("BAM\n");
	int t;

	+++++[ switch(*ptr){
			case 1: 
				{ 
					>+++++[
						printf("ONE %d!\n"\, *ptr);-
					]< 
				}; break;
			case 2: { 
				>++++[printf("TWO %d!\n"\, *ptr);-]< }; break;
			case 3: { 
				>+++[ printf("THREE %d!\n"\, *ptr);- ]< 
			}; break;
			case 4: { 
				>++[printf("FOUR %d!\n"\, *ptr);-]< 
			}; break;
			case 5: { 
				>+++[
					t = *ptr;
					>+++[printf("FIVE %d\, %d!\n"\, t\, *ptr);-]< 
				-]<
			}; break;
	}-]

Output:

	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	PONIS!!+-[]
	BÄM
	FIVE 3, 3!
	FIVE 3, 2!
	FIVE 3, 1!
	FIVE 2, 3!
	FIVE 2, 2!
	FIVE 2, 1!
	FIVE 1, 3!
	FIVE 1, 2!
	FIVE 1, 1!
	FOUR 2!
	FOUR 1!
	THREE 3!
	THREE 2!
	THREE 1!
	TWO 4!
	TWO 3!
	TWO 2!
	TWO 1!
	ONE 5!
	ONE 4!
	ONE 3!
	ONE 2!
	ONE 1!

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

	=>
	WUT?
	WUT?
	WUT?
	AAA

### C Funktions
Inlining of C functions is a little bit difficult to implement.
However, if your compiler supports something like the -fnested-functions
flag, you can just write your function to an arbitrary position in the
brainfuck source file.

Example:
	
	int foo(){
		+++[printf("Nothing!\n");-]
		return 0
	}
	
	++++++[
		>++++++++++<
	-]
	>+++++.printf("%d"\,*ptr);
	

![wat](img/wat2.gif)

TODO
----
Inclusion of user defined header files
