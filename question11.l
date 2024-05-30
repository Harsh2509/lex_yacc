%{
    #include <stdio.h>
    FILE *ifp, *ofp;
%}
%%
"<".*?">" {
    fprintf(ofp, "%s", yytext);
}
.|[\n] {}
%%
int yywrap(){
    return 1;
}

int main(){
    ifp = fopen("input.html", "r");
    ofp = fopen("output.html", "w");
    yyin = ifp;
    yylex();
    fclose(ifp);
    fclose(ofp);
    return 0;
}
