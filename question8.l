%{
#include <stdio.h>
#include <stdlib.h>
int words = 0;
int spaces = 0;
int characters = 0;
%}

%%
[^" "]+ { printf("Word: %s\n", yytext); words++; characters += yyleng; }
" " { spaces++; }

%%
int yywrap() {
    printf("Words: %d\n", words);
    printf("Spaces: %d\n", spaces);
    printf("Characters: %d\n", characters);
    return 1;
}

int main() {
    FILE *file = fopen("./input.txt", "r");
    if (!file) {
        printf("File not found\n");
        return 1;
    }
    yyin = file;
    yylex();
    return 0;
}