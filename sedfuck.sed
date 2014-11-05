#!/usr/bin/sed -n -f
##
# Summary: "Compiles" a given brainfuck script to
# License: GPLv2
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
	int *p = calloc(MAX, sizeof(int));
# --
$ {
a\
return EXIT_SUCCESS;\
}

e nohup sleep 0.2; gcc -fnested-functions -o sedfuck.out sedfuck.out.c > /dev/null  &
}

# -- for escaped brainfuck symbols
s/\\+/%P%/g;s/\\-/%M%/g;s/\\,/%A%/g;s/\\\./%U%/g
s/\\</%K%/g;s/\\>/%G%/g;s/\\\[/%W%/g;s/\\\]/%E%/g

# --
s/+/++(*p);/g;
s/-/--(*p);/g; 
s/,/*p = getchar();/g; 
s/\./printf("%c",*p);/g; 
s/>/++p;/g; 
s/</--p;/g; 
s/\[/while(*p){\n/g; 
s/\]/}\n/g; 
#s/ //g;

s/%P%/+/g;s/%M%/-/g;s/%A%/,/g;s/%U%/./g
s/%K%/</g;s/%G%/>/g;s/%W%/[/g;s/%E%/]/g
p;
