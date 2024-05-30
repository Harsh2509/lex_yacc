%{
#include<stdio.h>
int v=0,c=0;
%}
%%
[aeiouAEIOU] {v++; printf("Vowel: %c  |  ",yytext[0]);}
" "|[\n \t] ;
[^aeiouAEIOU\n] {c++; printf("Consonant: %c  |  ",yytext[0]);}
%%
int yywrap(){
    return 1;
}

int main()
{
    yylex();
    printf("Vowels: %d\nConsonants: %d\n",v,c);
    return 0;
}