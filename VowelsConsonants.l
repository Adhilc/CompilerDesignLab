%{
#include<stdio.h>
#include<string.h>
int vc=0,cc=0;
char vowel[100],cons[100];
%}
vowels[AEIOUaeiou]
consonants[B-DF-HJ-NP-TV-Zb-df-hj-np-tv-z]
%%
{vowels} {strcat(vowel,yytext);vc++;}
{consonants} {strcat(cons,yytext);cc++;}
. {}
%%
int yywrap(void){}
void main(){
yyin=fopen("input.txt","r");
yylex();
printf("No of Vowels:%d\nNo of Consonants:%d",vc,cc);
printf("\nVowels are:%s",vowel);
printf("\nConsonants are:%s",cons);
}
