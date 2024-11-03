%{
#include<stdio.h>
#include<stdlib.h>
int i=0,values[2];
char op;
%}

digit[0-9]
operator "+"|"-"|"/"|"*"

%%
{digit} {values[i++]=atoi(yytext);}
{operator} {op=yytext[0];}
%%
int yywrap(void){}
void main(){
printf("PRESS CTRL+D FOR RESULT\n");
printf("Enter the operation:");
yylex();
int result;
switch(op){
 case '+':result=values[0] + values[1];
 	  break;
 case '-':result=values[0] - values[1];
 	  break;
 case '*':result=values[0] * values[1];
 	  break;
 case '/':result=values[0] / values[1];
 	  break;
}
printf("\nThe result of the operation is:%d",result);
}


