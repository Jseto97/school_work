// prime.c
// module for working with prime numbers

#include <stdbool.h>

// Helper: prime_check(num, check) determines if check can be
// divided by num
bool prime_check(int num, int check){
    const int c = (num==check)?true:
    ((check%num==0)?false:prime_check(num+1,check));
    return c;
}

// is_prime(i) determines if i is prime
//   PRE: i > 1
//   POST: returns true if i is prime, false otherwise
bool is_prime(int i){
   const bool detec = (i == 1)? false : prime_check(2,i);
   return detec;
}

// next_prime(i) returns the smallest prime number greater than i
//   PRE: i > 0
//   POST: returns a prime number > i
int next_prime(int i){
    const int c = (is_prime(i))? i:
              next_prime(i+1);
    return c;
}
