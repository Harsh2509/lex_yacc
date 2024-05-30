%{
#include <stdio.h>
%}
%%
[0-9]+ {
    int num = atoi(yytext);
    int temp = num;
    int rev = 0;
    while(temp != 0){
        rev = rev * 10 + temp % 10;
        temp = temp / 10;
    }
    if(rev == num){
        printf("%d is a palindrome number\n", num);
    }else{
        printf("%d is not a palindrome number\n", num);
    }
}
[\n \t]+ ;
%%
int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}