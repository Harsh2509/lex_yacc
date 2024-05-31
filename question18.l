%{
#include <stdio.h>
#include <string.h>
int min = 1000;
char shortestWord[1000];
%}
%%
[^\n" "]+ {
    if(strlen(yytext) < min) {
        min = strlen(yytext);
        strcpy(shortestWord, yytext);
    }
}
%%
int yywrap() {
    printf("Shortest word: %s\n", shortestWord);
    return 1;
}

int main() {
    yylex();
    return 0;
}
