%{
#include "y.tab.h"
#include<stdio.h>	
int yywrap();
extern int yylval;
%}



%%

0    {yylval=0; return yytext[0];}
1    {yylval=1; return yytext[0];}
[/]  return DIV;
[\n] {yyterminate();}
.    {yyerror();yyterminate();}
%%

int yywrap()
{
	return 1;
}