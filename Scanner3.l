%{
	/* comments */
	#include <math.h>
	#include <string.h>
	#include <stdio.h>
	#include <stdlib.h>
	int line_num = 0;
%}
%%
^\n {
	printf("Line Number : %d\n", ++line_num);
}
([01]+)b {
	long ret = strtol(yytext, NULL, 2);
	printf("%d\n", ret);
}
([0-9]+)d {
	
	printf("INTEGER\n");
}
([0-9]+).([0-9]+)[eE][+-]?([0-9]*) {
	printf("SCN\n");
}

[ \t\r] {
	printf("_");
}

. ECHO;

%%
int yywrap(){
	return 1;
}
int main(){
	yylex();
	return 0;
}