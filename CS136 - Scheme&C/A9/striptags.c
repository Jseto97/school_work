#include <stdio.h>

int main(){
   char a = getchar();
   while (a != EOF){
      if (a != '<'){
         printf("%c",a);
         a = getchar();
         continue;
      }else {
         a = getchar();
         while (a != '>') {a = getchar();}
         a = getchar();
      }
   }
   return 0;
}

