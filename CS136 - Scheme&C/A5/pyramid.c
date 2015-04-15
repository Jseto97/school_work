// draw_pyramid.c
#include <stdio.h>

void draw_pyramid(int size){
    for(int i=0; i<size; i++) {
        for (int a=0; a<(size-i-1); a++){
            printf(" ");
        }
        for (int n=1; n<=i; n++){
            printf ("* ");
        }
        printf ("*");
        for (int a=0; a<(size-i-1); a++){
            printf(" ");
        }
        printf("\n");
    }
}

