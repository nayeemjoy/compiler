%{
	/* comments */
	#include <math.h>
	#include <string.h>
	int line_num = 0;
%}

%%
^\n {
	printf("Line Number : %d\n", ++line_num);
}
[ \t\r]+ ;
[abc]+ {
	char ar[200] = "";
	strcpy(ar,yytext);
	for(int i=0; i < strlen(ar);i++){
		if(ar[i] == 'a'){
			ar[i] = 'z';
		}
		else if(ar[i] == 'b'){
			ar[i] = 'y';
		}
		else{
			ar[i] = 'x';
		}
	}

	printf("%s\n",ar);
}
t[a-z]+ {
	printf("TSTART\n");
}
([a-z]+)w {
	printf("ENDW\n");
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