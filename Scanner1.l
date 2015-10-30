%{
	/* comments */
	#include <math.h>
	int line_num = 0;
%}

DIGIT [0-9]
ID [_a-z][a-z0-9A-Z_]*
FLOAT [1-9]{DIGIT}+.{DIGIT}+
%%

^\n {
	printf("Line Number : %d\n", ++line_num);
}
[\t\r]+ ;
(<|>|<=|>=|==) {
	printf("OPERATOR\n");
}
(if|else|switch|case|while|for) {
	printf("KEYWORD\n");
	
}
{DIGIT}+ {
	printf("INTEGER\n", ++line_num);
	
}
{DIGIT}+.{DIGIT}* {
	printf("DOUBLE\n");
	
}
{ID} {
	printf("ID\n");
	
}





. {
	printf("NOT RECOGNIZED\n");
	
};
%%
int yywrap(){
	return 1;
}
int main(){
	yylex();
	return 0;
}