%{
#include <stdio.h>
int a=0, b=0;
%}

%%
[0-9] {a = a*10 + *yytext - '0';}
[+\-*/] {
    while (1){
        char c = input();
        if (c=='\n') break;
        if (c==' ') continue;
        if (c>='0' && c<='9'){
            b = b*10 + c - '0';
            continue;
        }
    }
    if (*yytext=='+') printf("%d\n", a+b);
    if (*yytext=='-') printf("%d\n", a-b);
    if (*yytext=='*') printf("%d\n", a*b);
    if (*yytext=='/') printf("%d\n", a/b);
    a = b = 0;
}
. {printf("Invalid input\n");}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
