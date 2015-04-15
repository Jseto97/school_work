// safeint.c
// module for working with integer overflow

#include <limits.h>
// provides INT_MIN & INT_MAX

// For this module, we define a "valid int" to be:
// any int from -INT_MAX ... INT_MAX
// or in other words, any int *except* INT_MIN

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
    const int output = (square == INT_MIN) ? INT_MIN :
                       ((first == INT_MIN) ? INT_MIN :
                       ((second == INT_MIN) ? INT_MIN :
                       ((comb == INT_MIN) ? INT_MIN :
                       ((num == INT_MIN)? INT_MIN : num))));
    return output;
}
