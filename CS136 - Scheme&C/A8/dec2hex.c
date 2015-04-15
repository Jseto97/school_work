// dec2hex.c
#include<stdio.h>
#include<limits.h>


void dec2hex(int num, char arr[9]){
   for (int a=0; a<8;a++) {
      arr[a] = 0;
   }
   arr[8] ='\0';
   const int base = 16;
   int a[8];
   int exp = 0;

   while(num>0) {
      a[7-exp]=num%base;
      num /= base;
      exp ++;
      if (exp>7) break;
   }
   for (int i=0; i<7; i++){
       if (a[i]<10){
           arr[i] = 48+a[i];
       } else {
           arr[i] = 55+a[i];
       }
   }
}

