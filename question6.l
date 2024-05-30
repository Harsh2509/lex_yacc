%{
    #include <stdio.h>
%}
%%
[a-zA-Z_][a-zA-Z0-9_]* { printf("Valid Identifier: %s\n", yytext); input(); }
[^a-zA-Z_][^\n]* { printf("Invalid Identifier: %s\n", yytext); input();}
%%
int yywrap() { return 1; }

int main(){
    yylex();
    return 0;
}