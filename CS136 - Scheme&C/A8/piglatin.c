//piglatin.c
#include <stdio.h>
#include "tokenize.h"
#include <string.h>

void piglatin(const char input[], char output[]) {
   for (int i=0; i<1024; i++){
      output[i]=' ';
   }
   output[1024]='\0';
   tokenize_init(input);
   int count = 0;
   char *word, *fchar;
   word = tokenize_next();
   fchar = word;
   while (word!=NULL){
      if (*word=='a'||*word=='e'||*word=='i'||*word=='o'||
          *word=='u'||*word=='y'){
          while (*word!=NULL){
          output[count]=*word;
          count++;
          word++;}
          output[count]='w';
          output[count+1]='a';
          output[count+2]='y';
          count+=2;
      } else {
          while (*word!='a'&&*word!='e'&&*word!='i'&&*word!='o'&&
          *word!='u'&&*word!='y'){
          word++;
          }
          char *pos = word;
          while (word!=NULL){
            output[count]=*word;
            count++;
            word++;
          }
          word = fchar;
          while(word!=pos){
            output[count]=*word;
            count++;
            word++;
          }
          output[count]='a';
          output[count+1]='y';
          count+=2;
        }
        output[count]=' ';
        count++;
        word=tokenize_next();
        fchar=word;
     }
     output[count]='\0';
} 
