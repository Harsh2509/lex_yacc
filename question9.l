%{
#include <stdio.h>
FILE *fp;
%}

%%
[" "]+ { fprintf(fp, " "); }
. { fprintf(fp, "%c", yytext[0]);}
%%

int yywrap(){
    printf("Copied the contents to ./output.txt\n");
    return 1;
}

int main() {
    fp = fopen("output.txt", "w");
    FILE *input = fopen("input.txt", "r");
    if (!input) {
        printf("Error opening file\n");
        return 1;
    }
    yyin = input;
    yylex();
    return 0;
}