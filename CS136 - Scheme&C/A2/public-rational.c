#include <assert.h>
#include "rational.h"

int main(void) {

   const struct rational one = {1,1};
   const struct rational two = {2,1};
   const struct rational three = {3,1};
   const struct rational half = {1,2};
   
   // 1 mark:
   assert(r_equal(one,one));
   assert(r_equal(one,r_int(1)));
   // 1 mark:
   assert(r_equal(r_add(one,two),three));
   assert(r_equal(r_sub(three,one),two));
   // 1 mark:
   assert(r_equal(r_mult(one,two),two));
   // 1 mark:
   assert(r_equal(r_div(one,two),half));
}
