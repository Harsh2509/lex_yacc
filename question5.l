%{
#include <stdio.h>
%}
%%
[0-9]*?\.[0-9]+ { printf("Float: %s\n", yytext); }
[0-9]+ { printf("Integer: %s\n", yytext); }
.|\n {}
%%
int yywrap(){ return 1; }
int main(int argc, char **argv){
    yylex();
    return 0;
}
