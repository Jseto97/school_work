#include <stdbool.h>
#include "rational.h"
 
struct rational;

// NOTE: for all functions below, the return values will be *simplified*
//       the arguments do not have to be simplified

// Rules for simplifying rationals:
// * all integers (including zero) must have a denom of 1
// * all rationals will use the lowest possible denom,
//   so (2/4) will never be returned: instead, (1/2) would be returned
// * the denom cannot be negative.  (-1/-2) or (1/-2) are not simplified

// r_int(i) returns the rational for the integer i (i/1)
struct rational r_int(int i){
    const struct rational p={i,1}; 
    return p;
}

// Helper Function
//    PRE: n, m are valid rationals
//    POST: returns the greatest common divider of n and m
int gcd(int n,int m){
    const int c = (m==0)? n:gcd(m,(n%m));
    return c;
}

// r_add(a,b) adds two rationals a+b
//   PRE:  a,b are valid rationals
//   POST: returns simplified rational
struct rational r_add(struct rational a, struct rational b){
  const int up = a.num*b.denom+b.num*a.denom;
  const int down = a.denom*b.denom;
  const int simp = gcd(up,down);
  const struct rational p ={up,down};
  const struct rational q = {up/simp, down/simp};
  const struct rational outcome = (simp==1) ? p : q;
  return outcome;
}

// r_sub(a,b) subtracts two rationals a-b
//   PRE:  a,b are valid rationals
//   POST: returns simplified rational
struct rational r_sub(struct rational a, struct rational b){
  const int up = a.num*b.denom-b.num*a.denom;
  const int down = a.denom*b.denom;
  const int simp = gcd(up,down);
  const struct rational p ={up,down};
  const struct rational q = {up/simp, down/simp};
  const struct rational outcome = (simp==1) ? p : q;
  return outcome;
}

// r_mult(a,b) multiplies two rationals a*b
//   PRE:  a,b are valid rationals
//   POST: returns simplified rational
struct rational r_mult(struct rational a, struct rational b){
    const int up = a.num*b.num;
    const int down = a.denom*b.denom;
    const int simp = gcd(up,down);
    const struct rational p ={up,down};
    const struct rational q = {up/simp, down/simp};
    const struct rational outcome = (simp==1) ? p : q;
    return outcome;
}

// r_div(a,b) divides two rationals a/b
//   PRE: a,b are valid rationals
//        b is non-zero
//   POST: returns simplified rational
struct rational r_div(struct rational a, struct rational b){
    const int up = a.num*b.denom;
    const int down = a.denom*b.num;
    const int simp = gcd(up,down);
    const struct rational p ={up,down};
    const struct rational q = {up/simp, down/simp};
    const struct rational outcome = (simp==1) ? p : q;
    return outcome;
}

// r_equal(a,b) determines if rationals a and b are equal
//   PRE:  a,b are valid rationals
//   POST: returns true if a and b are the same number, false otherwise
bool r_equal(struct rational a, struct rational b){
    const int simpa = gcd(a.num, a.denom);
    const struct rational asim = {a.num/simpa,a.denom/simpa};
    const int simpb = gcd(b.num, b.denom);
    const struct rational bsim = {b.num/simpb, b.denom/simpb};
    const bool output = (asim.num==bsim.num && asim.denom==bsim.denom) ?
                        true : false;
    return output;
}     
