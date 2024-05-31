
%{
    #include <stdio.h>
%}

%s A B C DEAD

%%
<INITIAL>0 BEGIN A;
<INITIAL>1 BEGIN C;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("ACCEPTED\n");}

<A>0 BEGIN INITIAL;
<A>1 BEGIN B;
<A>\n BEGIN INITIAL; {printf("NOT ACCEPTED\n");}
<A>[^01\n] BEGIN DEAD;

<B>0 BEGIN C;
<B>1 BEGIN A;
<B>[^01\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("NOT ACCEPTED\n");}

<C>0 BEGIN B;
<C>1 BEGIN INITIAL;
<C>[^01\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("NOT ACCEPTED\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("INVALID\n");}
%%

int yywrap(){ return 1; }

void main()
{
yylex();
}
