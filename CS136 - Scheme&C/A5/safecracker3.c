#include"safe3.h"
#include <stdio.h>
#include<stdbool.h>

static bool check_unlock(code){
   while (unlock(code)!=1){
       code++;
   }
   return true;
}
 
 
void get_money(void){
    while (count_money()==(-1)){ 
        check_unlock(1);
    }
    printf("%d\n", count_money());
}
