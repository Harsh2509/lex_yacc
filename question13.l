%{
#include <stdio.h>
int fiveletterwords = 0;
%}

%%
[^" "\n\t]+ {
    if (yyleng == 5) {
        fiveletterwords++;
    }
}
%%

int yywrap() {
    printf("Number of five letter words: %d\n", fiveletterwords);
    return 1;
}

int main() {
    yylex();
    return 0;
}