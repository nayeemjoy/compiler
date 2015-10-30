%{
	/* comments */
%}
DIGIT [0-9]
ID [_a-z][a-z0-9A-Z_]*
%%
[1-9]{DIGIT}*.{DIGIT}* printf("DOUBLE\n");
. ECHO;
%%
int yywrap(){
	return 1;
}
int main(){
	yylex();
	return 0;
}