%{
    #include <stdio.h>
    FILE *fp;
%}

%%
"//" {
    while (1){
        char c = input();
        if (c == '\n'){
            break;
        }
    }
}
"/*" {
    while (1){
        char c = input();
        if (c=='*'){
            c = input();
            if (c=='/'){
                break;
            }
        }
    }
}
.|[\n] {
    fprintf(fp, "%c", yytext[0]);
}
%%

int yywrap(){
    fclose(fp);
    return 1;
}

int main(){
    fp = fopen("output.txt", "w");
    yylex();
    return 0;
}