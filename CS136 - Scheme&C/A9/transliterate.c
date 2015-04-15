#include <stdbool.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "transliterate.h"

bool is_map(const char map[27]){
     int letter[27]={0};
     for (int i=0; i<26; i++){
         int c = map[i];
         if (letter[c]==0){
            letter[c]=1;
         } else {
           return false;
         }
     }
     if (map[26]=='\0'){
         return true;
     } else {
         return false;
     }
} 


char *transliterate(const char *str, const char map[27]){
     const int n = strlen(str);
     char new[n];
     for (int i=0; i<n-1; i++){
         char a = str[i];
         if (a>='a' && a<='z'){
            int p = a-'a';
            new[i] = map[p];
         } else if (a>='A' && a<='Z'){
           int p = a-'A';
           new[i] = map[p];
         }
     }
     new[n-1] = '\0';
     char *pt = &new[n];
     return pt;
}

int main(void) {
  char str[] = "This is a TEST STRING for the transliterate function.";
  char map[] = "abctifghejklnmopqrzduvwxys";
  char *out = transliterate(str, map);
  printf("str: %s\nmap: [%s]\nout: %s\n", str, map, out);
  free(out);
}
