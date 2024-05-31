%{
#include <stdio.h>    
%}

%s A B C D E F DEAD

%%
<INITIAL>1 BEGIN DEAD;
<INITIAL>0 BEGIN A;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("ACCEPTED\n");}

<A>0 BEGIN DEAD;
<A>1 BEGIN B;
<A>[^01] BEGIN DEAD;

<B>0 BEGIN DEAD;
<B>1 BEGIN C;
<B>[^01] BEGIN DEAD;

<C>0 BEGIN C;
<C>1 BEGIN D;
<C>[^01] BEGIN DEAD;

<D>0 BEGIN C;
<D>1 BEGIN E;
<D>[^01] BEGIN DEAD;

<E>0 BEGIN F;
<E>1 BEGIN D;
<E>[^01] BEGIN DEAD;

<F>0 BEGIN C;
<F>1 BEGIN D;
<F>[^01\n] BEGIN DEAD;
<F>\n BEGIN INITIAL; {printf("ACCEPTED\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("NOT ACCEPTED\n");}

%%

int yywrap() {return 1;}
int main(){
    yylex();
    return 0;
}