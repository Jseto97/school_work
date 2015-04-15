//file: piglatin.c


#include <stdio.h>
#include "tokenize.h"
#include <string.h>


void piglatin (const char input[], char output[]) {
   int out = sizeof(output) / sizeof(char);
   for (int i=0; i <= out; i++){
      output[i] = ' ';
   }
   int outputcount = 0; //counts where to put output word
   tokenize_init(input); //now we can separate words
   char *curword;//stores the pointer returned by next
   char *firchar;//stores the pointer to the first char of the word
   curword = tokenize_next();//first word
   firchar = curword;
   while (curword != NULL) {//not the end of sentence, piglatinize word.
      //two cases, starts with consonant group or vowel.
      if (*curword == 'a' || 
          *curword == 'e' || 
          *curword == 'i' ||
          *curword == 'o' ||
          *curword == 'u' ||
          *curword == 'y') {//starts with a vowel
          while (*curword != NULL) {
            output[outputcount] = *curword;
            outputcount ++;
            curword ++;
         }//now curword is NULL and we have the word in output
      output[outputcount] = 'w';
      outputcount ++;
      output[outputcount] = 'a';
      outputcount ++;
      output[outputcount] = 'y';
      outputcount ++;
      }//now the word has way added in output
      else {//starts with consonant
         while (*curword != 'a' && 
             *curword != 'e' && 
             *curword != 'i' &&
             *curword != 'o' &&
             *curword != 'u' &&
             *curword != 'y') {//find the first vowel
             curword ++;
          }
          char *fvowel = curword; //store the position of the first vowel
          while (*curword != NULL) {
            //put into output
               output[outputcount] = *curword;
               outputcount ++;
               curword ++;
            } // the word has been put into output, stick consonants onto the output.
            curword = firchar; //rests curword to the first character of word
            while (curword != fvowel) {
               output[outputcount] = *curword;
               outputcount ++;
               curword ++;
            }//puts the consonants on the output
            output[outputcount] = 'a';
            outputcount ++;
            output[outputcount] = 'y';
            outputcount ++;
         } //done with consonant case, add space
         output[outputcount] = ' ';
         outputcount ++;
         curword = tokenize_next();//next word
         firchar = curword;
      } // no more words
      output[outputcount] = '\0';
}

int main() {
  char buf[999];
  piglatin("why would you not work this sucks", buf);
  printf("%s\n",buf);
  return 5;
}
   
        
          
   
   
