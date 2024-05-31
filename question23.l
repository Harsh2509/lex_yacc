%{
#include <stdio.h>    
%}

%s A B C DEAD

%%
<INITIAL>[0-9] BEGIN A;
<INITIAL>[a-zA-Z_] BEGIN C;
<INITIAL>. BEGIN DEAD;

<A>[0-9] BEGIN A;
<A>\n BEGIN INITIAL; {printf("INTEGER\n");}
<A>[.] BEGIN B;
<A>. BEGIN DEAD;

<B>[0-9] BEGIN B;
<B>\n BEGIN INITIAL; {printf("FLOAT\n");}
<B>. BEGIN DEAD;

<C>[a-zA-Z0-9_] BEGIN C;
<C>\n BEGIN INITIAL; {printf("IDENTIFIER\n");}
<C>. BEGIN DEAD;

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("INVALID\n");}

%%
int yywrap(){ return 1; }
int main(){
    yylex();
    return 0;
}