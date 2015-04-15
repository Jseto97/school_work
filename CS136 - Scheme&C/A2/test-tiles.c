// test_tiles.c
// testing module for tiles.c

#include <assert.h>
#include "tiles.h"

int main(void) {
    {// first case: unit tile with no waste
    const struct tile tile1 = {1,1};
    const struct price p1 = {1,100,100};
    const int rm_l1 = 10;
    const int rm_w1 = 10;
    const int wast1 = 0;
    const int num_t1 = 100;
    const int cost1 = 100;
    assert(r_equal(num_tiles(rm_l1,rm_w1,tile1), num_t1));
    assert(r_equal(wastage(rm_l1,rm_w1,tile1), wast1);
    assert(r_equal(tile_cost(rm_l1,rm_w1,tile1,p1), cost1);
    }
    
    {// second case: tile 4x1 with room 9x9, wastage 25%
    const struct tile tile2 = {4,1};
    const struct price p2 = {5,10,30};
    const int rm_l2 = 9;
    const int rm_w2 = 9;
    const int wast2 = 25;
    const int num_t2 = 27;
    const int cost1 = 90;
    assert(r_equal(num_tiles(rm_l2,rm_w2,tile2), num_t2);
    assert(r_equal(wastage(rm_l2,rm_w2,tile2), wast2);
    assert(r_equal(tile_cost(rm_l2,rm_w2,tile2,p2), cost2);
    }
    
    {// third case: more complex case
    const struct tile tile3 = {3,5};
    const struct price p3 = {3,20,50};
    const int rm_l3 = 17;
    const int rm_w3 = 19;
    const int wast3 = 11;
    const int num_t3 = 24;
    const int cost3 = 32;
    assert(r_equal(num_tiles(rm_l3,rm_w3,tile3), num_t3);
    assert(r_equal(wastage(rm_l3,rm_w3,tile3), wast3);
    assert(r_equal(tile_cost(rm_l3,rm_w3,tile1,p3), cost3);
    }
}
