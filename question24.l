
%{
    #include <stdio.h>
%}

%s A B C DEAD

%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN C;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("ACCEPTED\n");}

<A>a BEGIN INITIAL;
<A>b BEGIN B;
<A>\n BEGIN INITIAL; {printf("NOT ACCEPTED\n");}
<A>[^ab\n] BEGIN DEAD;

<B>a BEGIN C;
<B>b BEGIN A;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("NOT ACCEPTED\n");}

<C>a BEGIN B;
<C>b BEGIN INITIAL;
<C>[^ab\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("NOT ACCEPTED\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("INVALID\n");}
%%

int yywrap(){ return 1; }

void main()
{
yylex();
}
