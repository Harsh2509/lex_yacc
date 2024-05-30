%{
#include<stdio.h>
#include<string.h>
FILE *ifp, *ofp;
%}
%%
[a-zA-Z_][a-zA-Z0-9_]* {fprintf(ofp, "Identifier: %s\n", yytext);}
[0-9]+ {fprintf(ofp, "Number: %s\n", yytext);}
[ \t] ;
[ \n] ;
[(){};=,] {fprintf(ofp, "Special Symbol: %s\n", yytext);}
[+*/-] {fprintf(ofp, "Operator: %s\n", yytext);}
. ;
%%
int yywrap(){
    return 1;
}

int main(){
    ifp = fopen("input.c", "r");
    ofp = fopen("harsh.txt", "w");
    yyin = ifp;
    yylex();
    fclose(ifp);
    fclose(ofp);
    return 0;
}