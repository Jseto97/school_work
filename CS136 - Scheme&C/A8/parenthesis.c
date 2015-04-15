// parenthesis.c
#include<stdbool.h>
#include<string.h>
#include<stdio.h>

const char *match(const char *str){
    if( *str == '\0' || *str == ')' ) {
     return str; 
     }
    if( *str == '(' ){
      const char *closer = match(++str);
      if( *closer == ')' ){
          return match(++closer);
       }
     return str - 1;
     }
 return match(++str);
}

bool parenthesis(char str[]){
   char *p = *str;
   int len = strlen(p);
   while ;
}

int main(void){
   char str[] = "()()(())";
   bool out = parenthesis(str);
   printf("%d\n",out);
}
