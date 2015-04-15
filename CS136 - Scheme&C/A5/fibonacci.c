// fibonacci.c
#include <stdio.h>

int fib_iter(int n){
  if (n<=1){
      return n;
  } else {
    int i = 1;
    int first = 0;
    int second = 1;
    int accum = 1;
    while (i<n){
        accum = first + second;
        first = second;
        second = accum;
        i++;
    }
    return accum;
  }
}

