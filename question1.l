%{
#include <stdio.h>
#include <stdlib.h>
int line_count = 0;
int word_count = 0;
int space_count = 0;
int tab_count = 0;
%}
%%
\n {line_count++;}
\t {tab_count++; space_count+=4;}
[ ] {space_count++;}
[^\n\t ]+ {word_count++;}
%%
int yywrap(void) {
    return 1;
}

int main(){
    yylex();
    printf("Number of lines: %d\n", line_count);
    printf("Number of words: %d\n", word_count);
    printf("Number of spaces: %d\n", space_count);
    printf("Number of tabs: %d\n", tab_count);
    return 0;
}