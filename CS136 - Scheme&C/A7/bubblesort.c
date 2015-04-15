// bubblesort.c
#include<stdio.h>

void bubblesort(int arr[], const int len){
    int change = 0;
    for(int n=0; n<len-1; n++){
        if (arr[n]>arr[n+1]){
            int temp = arr[n];
            arr[n]=arr[n+1];
            arr[n+1] = temp;
            change++;
        } 
     }
     if (change>0){
         bubblesort(arr, len);
     }   
}

