%{
#include <stdio.h>    
#include <string.h>
#include <math.h>
%}
%%
[0-9]+ {
    int num = atoi(yytext);
    int square = num * num;
    int n = strlen(yytext);
    int flag = 1;
    while (num){
        if (num % 10 != square % 10){
            flag = 0;
            break;
        }
        num /= 10;
        square /= 10;
    }
    if (flag){
        printf("Automorphic number %s\n", yytext);
    }
    else{
        printf("Not an automorphic number %s\n", yytext);
    }
}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}