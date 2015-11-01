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


(a|an|the)[ \n] {
	printf("ARTICLE\n");
}
([A-Z]([a-z]*))[ \n] {
	printf("NOUN\n");
}
(is|do|go|be|are|was|were|did)[ \n] {
	printf("VERB\n");
}

([a-zA-Z]+)e?s[ \n] {
	printf("PLURAL\n");
}

([a-zA-Z]+)ly[ \n] {
	printf("ADVERB\n");
}

([a-zA-Z]+)ing[ \n] {
	printf("CONTINUOUS\n");
}
[ \t\r] ;

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