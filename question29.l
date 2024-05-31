
%{
    #include <stdio.h>
%}

%s A B C D DEAD

%%
<INITIAL>0 BEGIN A;
<INITIAL>1 BEGIN C;
<INITIAL>. BEGIN DEAD;

<A>0 BEGIN A;
<A>1 BEGIN B;
<A>[\n] BEGIN INITIAL; {printf("String Rejected\n");}
<A>. BEGIN DEAD;

<B>0 BEGIN A;
<B>1 BEGIN B;
<B>[\n] BEGIN INITIAL; {printf("String Accepted\n");}
<B>. BEGIN DEAD;

<C>0 BEGIN D;
<C>1 BEGIN C;
<C>[\n] BEGIN INITIAL; {printf("String Rejected\n");}
<C>. BEGIN DEAD;

<D>0 BEGIN D;
<D>1 BEGIN C;
<D>[\n] BEGIN INITIAL; {printf("String Accepted\n");}
<D>. BEGIN DEAD;

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("INVALID STRING\n");}

%%
int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}