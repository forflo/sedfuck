##
# Summary: "Compiles" a given brainfuck script to 
# a runnable binary file.
# Author: Florian Mayer
##
1 i\
#include <stdio.h>\
#include <stdlib.h>\
#include <dlfcn.h>\
#define MAX 10000\
int main(int argc, char **argv){\
	int i;\
	int *ptr = calloc(MAX, sizeof(int));
# --
$ {
a\
return EXIT_SUCCESS;\
}

e nohup sleep 0.2; gcc -fnested-functions -o sedfuck.out sedfuck.out.c > /dev/null  &
}

# -- for better inlining
s/\\+/%P%/g;s/\\-/%M%/g;s/\\\*/%A%/g;s/\\\./%U%/g
s/\\</%K%/g;s/\\>/%G%/g;s/\\\[/%W%/g;s/\\\]/%E%/g

# --
s/+/++(*ptr);/g;
s/-/--(*ptr);/g; 
s/^\*/getchar(*ptr);/g;
s/\([^(]\)\*/\1getchar(*ptr);/g; 
s/\([^(]\)\*/\1getchar(*ptr);/g; 
s/\./printf("%c",*ptr);/g; 
s/>/++ptr;/g; 
s/</--ptr;/g; 
s/\[/while(*ptr){/g; 
s/\]/}/g; 
#s/ //g;

s/%P%/+/g;s/%M%/-/g;s/%A%/*/g;s/%U%/./g
s/%K%/</g;s/%G%/>/g;s/%W%/[/g;s/%E%/]/g
p;
