%{
    #include <stdio.h>
    #include <string.h>
%}

%%
[a-zA-Z0-9]+ {
    int len = yyleng;
    int i=0, j=len-1;
    int flag=1;
    while (i<j){
        if (yytext[i++] != yytext[j--]){
            flag = 0;
            break;
        }
    }
    if (flag){
        printf("%s is palindrome\n", yytext);
    } else {
        printf("%s is not palindrome\n", yytext);
    }
}
.|\n ;
%%
int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}