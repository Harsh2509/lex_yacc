
%{
#include <stdio.h>    
%}
%%
"int"|"float"|"while"|"if"|"else" { printf("Keyword: %s\n", yytext); }
"="|"=="|"<="|">="|"<"|">" { printf("Operator: %s\n", yytext); }
";"|"{"|"}"|"," { printf("Separator: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[0-9]+ { printf("Number: %s\n", yytext); }
[\t \n] { }
%%
int yywrap() { return 1; }
int main(){
    yylex();
    return 0;
}