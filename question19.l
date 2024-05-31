%{
#include<stdio.h>
%}
%%
[0-9]+ {
    int num = atoi(yytext);
    int square = num * num;
    int sum = 0;
    while (square){
        sum += square % 10;
        square /= 10;
    }
    if (sum == num){
        printf("%d is a neon number\n", num);
    } else {
        printf("%d is not a neon number\n", num);
    }
}
. ;
%%
int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}