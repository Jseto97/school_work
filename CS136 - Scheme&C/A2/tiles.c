// tiles.c
// module for calculating tiles required to be put in a room with given dimension and the cost
// declarations copied from tiles.h(interface)
#include "tiles.h"

struct tile;
struct price;

//------------------------------------------------------------------------
// Helper Functions
int ceil_div(int num1,int num2){
    const int output = (num1%num2==0) ? (num1/num2) :
                       (num1/num2 + 1);
    return output;
}

int area_calc(int tl, int tw, int rl, int rw){
          const int a = ceil_div(rl,tl);
          const int b = ceil_div(rw,tw);
          return a*b;
}
//------------------------------------------------------------------------

// Main Function
int num_tiles(int rooml, int roomw, struct tile num){
    const int length = (num.tlen>num.twid) ? num.tlen : num.twid;
    const int width = (num.tlen<num.twid) ? num.tlen : num.twid;
    const int try1 = area_calc(length,width,rooml,roomw);
    const int try2 = area_calc(width,length,rooml,roomw);
    const int outcome = (try1<try2) ? try1 : try2;
     return outcome;
}

int wastage(int rooml, int roomw, struct tile num){
    const int tile_area = num.tlen * num.twid * num_tiles(rooml,roomw,num);
    const int room_area = rooml*roomw;
    const int percent = (tile_area-room_area)*100/tile_area;
    return percent;
}

int tile_cost(int rooml, int roomw, struct tile num, struct price p){
    const int t = num_tiles(rooml,roomw,num);
    const int group = t/p.quant;
    const int pr = group*p.bulk;
    const int price1 = group*p.bulk + (t%p.quant)*p.unit;
    const int price2 = (group+1)*p.bulk;
    const int output = (t%p.quant == 0) ? pr:
                       ((price1<price2)?price1:price2);
    return output;
}
