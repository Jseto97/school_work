## CS116 Assignment 05
## Question 4

# import
import check

# win_odds: (union 1,2,3,4,5,6) (union 1,2,3,4,5,6) (union 1,2,3,4,5,6) 
# (union 1,2,3,4,5,6) -> (union "AB" "CD" "ABCD")

# Purpose: produces a string indicating the winner of the two teams by 
# comparing the result of given die value (a) (b) (c) (d)

# Effect: no mutation, no effect

# Examples for win_odds:
# win_odds(1, 1, 1, 1) => "ABCD"
# win_odds(2, 3, 6, 6) => "AB"
# win_odds(2, 3, 5, 6) => "CD"
# win_odds(2, 2, 1, 3) => "ABCD"
# win_odds(1, 1, 1, 2) => "CD"
# win_odds(3, 5, 5, 5) => "CD"
# win_odds(2, 4, 2, 2) => "AB"
# win_odds(1, 5, 1, 3) => "AB"
# win_odds(6, 6, 4, 4) => "AB"

def win_odds (a,b,c,d):
    ## constants for calculation
    sum_ab = a + b
    sum_cd = c + d
    ## when one of the value is odd and another one is even
    if sum_ab % 2 == 1 and sum_cd % 2 == 0:
        return "AB"
    elif sum_ab % 2 == 0 and sum_cd % 2 == 1:
        return "CD"
    ## when both values are odd
    elif sum_ab % 2 == 1 and sum_cd % 2 == 1:
        if sum_ab > sum_cd:
            return "AB"
        elif sum_ab < sum_cd: 
            return "CD"
        elif a*b == 10 and not c*d == 10:
            return "AB"
        elif c*d == 10 and not a*b == 10:
            return "CD"
        elif a*b > c*d:
            return "AB"
        elif c*d > a*b:
            return "CD"
        else:
            return "ABCD"
    else:
    ## when both values are even, the bigger value wins
        #it is not mentioned in the question but appears in the given
        #examples
        if sum_ab > sum_cd:
            return "AB"
        elif sum_ab < sum_cd:
            return "CD"
    ## when both values are even, and all numbers are odd
        elif a % 2 == 1 and c % 2 == 1:
            if sum_ab % max(a,b,c,d) == 0 and \
            not sum_cd % max(a,b,c,d) == 0:
                return "AB"
            elif sum_cd % max(a,b,c,d) == 0 and \
            not sum_ab % max(a,b,c,d) == 0:
                return "CD"
            else: 
                return "ABCD"
    ## when both values are even, and a,b are odd c,d are even
        elif (a % 2 == 1 and c % 2 == 0):
            if sum_ab % max(a,b) == 0 and \
            not sum_cd % max(a,b) == 0:
                return "AB"
            elif sum_cd % max(a,b) == 0 and \
            not sum_ab % max(a,b) == 0:
                return "CD"
            else: 
                return "ABCD"
    ## when both values are even, and a,b are even c,d are odd
        elif (a % 2 == 0 and c % 2 == 1):
            if sum_ab % max(c,d) == 0 and \
            not sum_cd % max(c,d) == 0:
                return "AB"
            elif sum_cd % max(c,d) == 0 and \
                 not sum_ab % max(c,d) == 0:
                return "CD"
            else: 
                return "ABCD"
        else:
            return "ABCD"
        
# Tests
check.expect("Q4T1", win_odds(1,1,1,1), "ABCD")
check.expect("Q4T2", win_odds(1,1,1,2), "CD")
check.expect("Q4T3", win_odds(1,2,1,1), "AB")
check.expect("Q4T4", win_odds(1,5,2,4), "ABCD")
check.expect("Q4T5", win_odds(2,4,1,3), "AB")
check.expect("Q4T6", win_odds(2,5,3,4), "AB")
check.expect("Q4T7", win_odds(1,6,3,4), "CD")
check.expect("Q4T8", win_odds(1,6,2,5), "CD")
check.expect("Q4T9", win_odds(2,2,6,4), "CD")
check.expect("Q4T10", win_odds(2,3,5,1), "AB")
check.expect("Q4T11", win_odds(2,3,6,6), "AB")
check.expect("Q4T12", win_odds(2,3,5,6), "CD")
check.expect("Q4T13", win_odds(2,2,1,3), "ABCD")
check.expect("Q4T14", win_odds(3,5,5,5), "CD")
check.expect("Q4T15", win_odds(1,5,1,3), "AB")
check.expect("@4T16", win_odds(4,6,5,1), "AB")