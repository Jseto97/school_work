// censor.c
#include<stdbool.h>
#include<string.h>
#include<stdio.h>

void censor(char str[], char pat[]){
   const int n = strlen(str);
   const int m = strlen(pat);
   for (int i=0; i<n; i++){
      if (str[i]==pat[0]){
         int pred = 0;
         for (int j=0; j<m; j++){
            if (str[i+j]!=pat[j]){
               break;
            }
            pred = 1;
         }
         if (pred==1){
             for (int j=0; j<m; j++){
               str[i+j]='*';
             }
         }
       }
    }
}

