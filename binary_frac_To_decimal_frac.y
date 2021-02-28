%token DIV
%start N
%{
  #include<stdio.h>
  void yyerror();
%}

%%

N        : numer DIV denom
         | numer
         ;

numer    : converter      {printf("\n%d",$$);} 
         ;

denom    : converter      {printf("/%d\n",$$);}
         ;

converter:converter last {$$=$1*2+$2;} 	
         |last           {$$=$1;}
         ;

last     :'1' {$$=$1;}
         |'0' {$$=$1;}
         ;
%%

int main()
{
	
	yyparse();
     
}

void yyerror()
{
	printf("error");
}