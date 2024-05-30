
%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%%
"/*"  {
        while(1){
            char c = input();
            if (c=='*'){
                c = input();
                if (c=='/'){
                    break;
                }
            }
        }
    }
"//" {
        while(1){
            char c = input();
            if (c=='\n')
                break;
        }
    }
. { printf("%c", yytext[0]);}

%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}