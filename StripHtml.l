%%
"<"[^>]+">" {}
%%
int yywrap(void){}
void main(){
yyin=fopen("input.txt","r");
yyout=fopen("output.txt","w");
yylex();
}
