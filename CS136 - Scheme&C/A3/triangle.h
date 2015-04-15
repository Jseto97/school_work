/********************************************************************
 Assignment 3, Question 6
 (checking if the given points can make a right triangle
********************************************************************/

// triangle. h

# include <stdbool.h>
# include <stdio.h>

// a posn structure represents a position struct with coordinare x and y
struct posn 
{
    int x;
    int y;
};

bool is_right_triangle(struct posn *a, struct posn *b, struct posn *c);


