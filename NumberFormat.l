%{
#include <stdio.h>
#include <stdlib.h>

%}

digit[0-9]
%%
{digit}*("."{digit}+)?("E"("+"|"-")?{digit}+)? {printf("Valid syntax\n");exit(0);}
.* {printf("Not valid suntax\n");exit(0);}
%%

int yywrap(void) {}
void main() {
char input[100];
printf("Enter the number:");
yylex();
}
