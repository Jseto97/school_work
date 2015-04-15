// tokenize.c 
#include <stdio.h>
#include <string.h>

char tokenizer[1024];
char buffer[1024];

void tokenize_init(const char str[]){
   const int n = strlen(str);
   for (int i=0; i<n; i++){
      tokenizer[i] = str[i];
   }
}

char *tokenize_next(){
   static int count = 0;
   const int n = strlen(tokenizer);
   char t = tokenizer[count];
   int i = 0;
   while (count<n){
      while (((t>=65&&t<=90)||(t>=97||t<=122))&&(i<1023)){
      buffer[i]=t;
      count++;
      i++;
      }
   if (i>0){
      buffer[i]='\0';
      char *p = buffer;
      return p;
   }
   count++;
   }
   return NULL;  
} 
   
