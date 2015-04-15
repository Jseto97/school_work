//swapcase.c
#include<stdio.h>

void swapcase(void){
    char c = getchar();
    const int magic = 32;
    while (c!=EOF){
      if (65<=c&&c<=90){
            c += magic;
        } else if (97<=c&&c<=122){
            c -= magic;
        }  
        printf("%c", c);
        c = getchar();
    }
}

int main(void){
    swapcase();
}
