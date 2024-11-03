%{
#include<stdio.h>
int top=-1,STACK[100];
void push(int i){STACK[++top]=i;}
int pop(){return STACK[top--];}
int calculate(int a,int b, char op){
 switch(op){
  case '+':return a + b;
  case '-':return a - b;
  case '*':return a * b;
  case '/':return a / b;
  default : return 0;
 }
}
%}

digit[0-9]
operator "+"|"-"|"/"|"*"

%%
{digit}+ {push(atoi(yytext));}
{operator} {push(calculate(pop(),pop(),yytext[0]));}
%%
int yywrap(void){}
void main(){
printf("PRESS CTRL+D FOR RESULT\n");
printf("Enter the postfix expression:");
yylex();
printf("\nResult is:%d",pop());
}

