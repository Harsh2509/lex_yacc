%{
#include <stdio.h>   
int flag = 0; 
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

ArithmeticExpression: E {
    printf("Result is %d\n", $$);
    return 0;
};

E:      E '+' E {$$=$1+$3;}
    |   E '-' E {$$=$1-$3;}
    |   E '*' E {$$=$1*$3;}
    |   E '/' E {$$=$1/$3;}
    |   '(' E ')' {$$=$2;}
    |   NUMBER {$$=$1;}
    ;

%%

void main(){
    yyparse();
    if (flag==0)
        printf("Entered arithematic expression is valid\n\n");
}

void yyerror(){
    printf("Entered arithematic expression is invalid.\n\n");
    flag = 1;
}