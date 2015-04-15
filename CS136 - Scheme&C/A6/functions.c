#include <stdio.h>

// Summation:  sum[i = 1 to n] O(1)
// Time:       O(n)
void draw_line(int n) {
 for (int i = 0; i < n; i++) {
   printf("*");
 }
 printf("\n");
}

// Summation:  
// inner loop: sum[j=0 to i] O(n)
// outer loop: sum[j=0 to n] O(n^2)
// Time: O(n^2)
void draw_function_a(int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < i; j++) {
      printf("*");
    }
    printf("\n");
  }
}

// Summation:  
//    inner loop: sum[j=0 to 2n] O(n)
//    outer loop: sum[i=2n to 0] O(n^2)
// Time: O(n^2)      
void draw_function_b(int n) {
  for (int i = 2*n; i > 0; i--) {
    for (int j = 0; j < i; j++) {
      printf("X");
    }
    for (int j = 0; j < 2*n-i; j++) {
      printf("Y");
    }
    printf("\n");
  }
}

// Summation: 
//    inner loop: sum[j=0 to i] O(n)
//    outer loop: sum[i=0 to n] O(n^2)
//    inner loop: sum[k=0 to j] O(n)
//    outer loop: sum[j=0 to (n-i)/5] O(n^2)
// Time: O(n^2)     
void draw_function_c(int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j <= i; j++) {
      printf("X");
    }
    for (int j = 0; j < (n-i)/5; j++) {
      for (int k = 0; k < j; k++) {
        printf("Y");
      }
    }
    printf("\n");
  }
}


int main(void) {
  draw_line(5);
  printf("\n");

  draw_function_a(5);
  printf("\n");

  draw_function_b(5);
  printf("\n");

  draw_function_c(5);
}
