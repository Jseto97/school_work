#include <stdio.h>
// reverse.c
 
void reverse(int arr[], const int len){
    int a[len];
    for (int n = 0; n < len; n++) {
        a[n] = arr[len-n-1];
    }
    for (int i = 0; i<len; i++)
        arr[i] = a[i];
}

