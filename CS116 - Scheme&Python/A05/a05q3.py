## CS116 Assignment 05
## Question 3

# import
import check
from math import log

##--------------------------------------------------------------------
## Helper Function

# rc_height: (union int float) int (union int float) -> int

# Purpose: produces the number(x) of rubik's cube required over the 
# given height (h) compare to the given height (rc_h)

# Effect: Mutates the number of rubik's cube (x) every time and the
# height of rubik's cube(rc_h)

# Examples: rc_height(0,0,0) => 0
# rc_height(1,2,1) => 2
# rc_height(2,1,3) => 1
# rc_height(3,0,2) => 18

def rc_height(rc_h,x,h):
    comp = 1- 1.0/100000
    rc = 0.057
    if h >= rc_h:
        return x
    else:
        return rc_height (rc_h,x+1, (h + rc * comp**(x-1)))

# Test
check.expect("Q3HT1", rc_height(0,0,1), 0)
check.expect("Q3HT2", rc_height(1,2,1), 2)
check.expect("Q3HT3", rc_height(2,1,3), 1)
check.expect("Q3HT4", rc_height(3,0,2), 18)
check.expect("Q3HT5", rc_height(4.5,3,1.2), 61)

##--------------------------------------------------------------------

# get_numrc_a: (union int float) -> int

# Purpose: produces the number of rubik's cubes required to stack
# up to the number of given (height)

# Examples: get_numrc_a(0) => 0
# get_numrc_a(1) => 19
# get_numrc_a(11) => 194

def get_numrc_a(height):
    if height == 0:
        return 0
    else:
        return rc_height (height,0,0)

# Tests
check.expect("Q3T1", get_numrc_a(0), 0)
check.expect("Q3T2", get_numrc_a(1), 18)
check.expect("Q3T3", get_numrc_a(11), 194)
check.expect("Q3T4", get_numrc_a(18.5), 326)
check.expect("Q3T5", get_numrc_a(24.5), 431)
check.expect("Q3T6", get_numrc_a(33.33), 587)
        
##**********************************************************************

# get_nimrc_b: (union of int float) -> int

# Purpose: produces the number of rubik's cubes required to build the
# given height(height)

# Effect: no effect

# Examples: get_numrc_b(0) => 0
# get_numrc_b(1) => 19
# get_numrc_b(11) => 194

def get_numrc_b(height):
    if height == 0:
        return 0
    else:
        h_rc = 0.057
        comp = 1 - 1.0/100000
        total = log(1 - height* (1-comp)/h_rc) / log(comp)
        return int(total+1)

# Tests
check.expect("Q3total1", get_numrc_b(0), get_numrc_a(0))
check.expect("Q3total2", get_numrc_b(1), get_numrc_a(1))
check.expect("Q3total3", get_numrc_b(11), get_numrc_a(11))
check.expect("Q3total4", get_numrc_b(18.5), get_numrc_a(18.5))
check.expect("Q3total5", get_numrc_b(24.5), get_numrc_a(24.5))
check.expect("Q3total6", get_numrc_a(33.33), get_numrc_a(33.33))