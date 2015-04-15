// rational.h
// module for working with rational numbers

#include <stdbool.h>

// a rational structure represents a rational number 
//   with a numerator (num) and a denominator (denom):
// * for example, num = 1, denom = 3 corresponds to a third (1/3)
// * denom can never be 0
struct rational {
  int num;
  int denom;
};

// NOTE: for all functions below, the return values will be *simplified*
//       the arguments do not have to be simplified

// Rules for simplifying rationals:
// * all integers (including zero) must have a denom of 1
// * all rationals will use the lowest possible denom,
//   so (2/4) will never be returned: instead, (1/2) would be returned
// * the denom cannot be negative.  (-1/-2) or (1/-2) are not simplified

// r_int(i) returns the rational for the integer i (i/1)
//   PRE:  true
//   POST: returns the rational (i/1)
struct rational r_int(int i);

// r_add(a,b) adds two rationals a+b
//   PRE:  a,b are valid rationals
//   POST: returns simplified rational
struct rational r_add(struct rational a, struct rational b);

// r_sub(a,b) subtracts two rationals a-b
//   PRE:  a,b are valid rationals
//   POST: returns simplified rational
struct rational r_sub(struct rational a, struct rational b);

// r_mult(a,b) multiplies two rationals a*b
//   PRE:  a,b are valid rationals
//   POST: returns simplified rational
struct rational r_mult(struct rational a, struct rational b);

// r_div(a,b) divides two rationals a/b
//   PRE: a,b are valid rationals
//        b is non-zero
//   POST: returns simplified rational
struct rational r_div(struct rational a, struct rational b);

// r_equal(a,b) determines if rationals a and b are equal
//   PRE:  a,b are valid rationals
//   POST: returns true if a and b are the same number, false otherwise
bool r_equal(struct rational a, struct rational b);
