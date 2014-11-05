##
# Summary: "Compiles" a given sed script to 
# compilable C-Code
# Author: Florian Mayer
##
1 i\
#include <stdio.h>\
#include <stdlib.h>\
#define MAX 10000\
int main(int argc, char **argv){\
	int i;\
	int *ptr = calloc(MAX, sizeof(int));
# --
$ {
a\
return EXIT_SUCCESS;\
}
e nohup sleep 3; gcc -o sedfuck.out sedfuck.out.c > /dev/null &
}
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
s/ //g;
p;
