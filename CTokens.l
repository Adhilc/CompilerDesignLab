%{
#include<stdio.h>
#include<stdlib.h>
char keywords[100][100],operator[100][100],identifier[100][100],specials[100][100];
int i,j,k,m,s;
%}

keyword "int"|"float"|"char"|"bool"|"double"|"for"|"while"|"do"|"continue"|"break"|"switch"|"case"|"return"
special "@"|"#"|"$"|"("|")"|"["|"]"|"{"|"}"|"&"
aop "+"|"-"|"*"|"/"|"%"
lop "&&"|"||"|"!"
relop ">"|"<"|">="|"<="|"=="|"!="
digit[0-9]
letter[a-zA-Z]
%%
{keyword} {strcpy(keywords[i++],yytext);}
{special} {strcpy(specials[s++],yytext);}
({aop}|{lop}|{relop}) {strcpy(operator[j++],yytext);}
({letter}|_)({letter}|{digit}|_)* {strcpy(identifier[k++],yytext);}
. {}
%%
int yywarp(void){}
void main(){
yyin=fopen("input.txt","r");
yylex();
printf("The Tokens are:\n");
printf("Keywords:");
for(m=0;m<i;m++){
  printf("%s\t",keywords[m]);
  }
printf("\nIdentifiers:");
for(m=0;m<k;m++){
  printf("%s\t",identifier[m]);
  }
printf("\nOperators:");
for(m=0;m<j;m++){
  printf("%s\t",operator[m]);
  }
printf("\nSpecial:");
for(m=0;m<s;m++){
  printf("%s\t",specials[m]);
  }
}
