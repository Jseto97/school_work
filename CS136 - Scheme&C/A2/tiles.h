/*************************************************************************
  Assignment 2, Problem 3
  (tiles required to be put in a room 
  with given dimension and the cost)
  By Tianlu Zhu [t8zhu]
*************************************************************************/

// tiles.h(interface)


// a tile structure represents a tile with length(tlen) and width(twid): 
// * for example, tlen = 4, twid = 3 corresponds to a tile with area 4*3  

struct tile {
  int tlen;
  int twid;
};

// a price structure represents the pricing infomation of tiles with unit, quant, bulk: 
/* - unit is an integer representing the cost of one tile
   - quant is an integer representing the number of tiles in a bulk
   - bulk is an integer indicating the price of a bulk of tiles */

struct price {
  int unit;
  int quant;
  int bulk;
};

// Helper Functions 
// ceil_div returns the ceiling integer of the division of two given integers num1 and num2
//   * PRE: num2 is not zero
//   * POST: returns the ceiling of integer (num1/num2)

// area_calc returns the integer representing the number of the used tiles
//   * PRE: tl, tw are not zero
//   * POST: returns an integer

//------------------------------------------------------------------------
// Main Function

// num_tiles determines the number of tiles required in a given dimension
//   * PRE: rooml,roomw, and numbers in num are all positive to make it valid
//   * POST: returns an integer as the least number of tiles required
int num_tiles(int rooml, int roomw, struct tile num);

// wastage determines the unused percentage over the area of used tiles
//   * PRE: rooml,roomw, and numbers in num are all positive to make it valid
//   * POST: returns an integer representing the percentage of waste area
int wastage(int rooml, int roomw, struct tile num);

// total cost determines the minimun cost of tiles by given room dimension and other tile information
//   * PRE: rooml,roomw, and numbers in num and p are all positive to make it valid
//   * POST: returns the least integer cost
int tile_cost(int rooml, int roomw, struct tile num, struct price p);
