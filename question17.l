%{
    #include <stdio.h>
%}

%%
[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+ { printf("Valid email\n"); }
.+ { printf("Invalid email\n"); }
%%
int yywrap() { return 1; }
int main() {
    yylex();
    return 0;
}