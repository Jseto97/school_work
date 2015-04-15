// triangle.c

# include "triangle.h"
# include <stdbool.h>
# include <stdio.h>

bool check_line(struct posn*a, struct posn *b, struct posn *c){
    if (((a->x == b->x)&&(b->x == c->x))||((a->y == b->y)&&(b->y == c->y))) {
        return true;
    } else {
       const int k_ab = (a->y - b->y)/(a->x - b->x);
       const int m_ab = b->y - b->x*k_ab;
       const int k_ac = (a->y - c->y)/(a->x - c->x);
       const int m_ac = c->y - c->x*k_ac;
       const int k_bc = (b->y - c->y)/(b->x - c->x);
       const int m_bc = c->y - c->x*k_bc;
       if (c->y == c->x*k_ab + m_ab||b->y == b->x*k_ac + m_ac|| a->y == a->x*k_bc + m_bc) {
          return true;
       } else {
          return false;
       }
     }
}

bool is_right_triangle(struct posn *a, struct posn *b, struct posn *c){
    const int ab = (a->x - b->x)*(a->x - b->x) + (a->y - b->y)*(a->y - b->y);
    const int ac = (a->x - c->x)*(a->x - c->x) + (a->y - c->y)*(a->y - c->y);
    const int bc = (c->x - b->x)*(c->x - b->x) + (c->y - b->y)*(c->y - b->y);
    return (check_line(a,b,c)) ? false : ((bc== ab+ac) ? true : ((ac==bc+ab) ? true : ((ab==ac+bc) ? true : false)));
}


