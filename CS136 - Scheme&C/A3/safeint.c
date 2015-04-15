// safeint.c
// module for working with integer overflow

#include <limits.h>
// provides INT_MIN & INT_MAX

// For this module, we define a "valid int" to be:
// any int from -INT_MAX ... INT_MAX
// or in other words, any int *except* INT_MIN
int valid_int(int i){
    const int c = (i != INT_MIN) ? i : INT_MIN;
    return c;
}

// safe_add(x,y) returns x+y or 
//     returns INT_MIN if x+y is not a valid int
//   PRE:  x,y are valid int
//   POST: returns INT_MIN or valid int
int safe_add(int x, int y){
    const int number = x + y;
    const int output = (number<x) ? INT_MIN : valid_int(number);
    return output;
}

// safe_mult(x,y) returns x*y or 
//     returns INT_MIN if x*y is not a valid int
//   PRE:  x,y are valid int
//   POST: returns INT_MIN or valid int
int safe_mult(int x, int y){
    const int number = x*y;
    const int output = (number<x) ? INT_MIN : valid_int(number);
    return output;
}

// a quadratic structure represents the coefficients
//   of a polynomial of order 2: a*x^2 + b*x + c
struct quadratic {
  int a;
  int b;
  int c;
};

// safe_quad_eval(q,x) evaluates quadratic q(x) or
//     returns INT_MIN if q(x) is not a valid int
//   PRE:  q.a,q.b,q.c and x are all >= 0
//   POST: returns INT_MIN or q(x) [int >= 0]
int safe_quad_eval(struct quadratic q, int x){
    const int square = x*x;
    const int first = q.a*(x*x);
    const int second = q.b*x;
    const int comb = first + second;
    const int num = q.a*(x*x) + q.b*x + q.c;
    const int output = (square < x && x != 0) ? INT_MIN :
                       ((first < square && q.a != 0) ? INT_MIN :
                       ((second < x && q.b != 0) ? INT_MIN :
                       ((comb < second) ? INT_MIN :
                       ((num == INT_MIN || num <= q.c)? INT_MIN : num))));
    return output;
}
