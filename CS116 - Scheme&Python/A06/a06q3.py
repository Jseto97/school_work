import math
import check

# Question 3

## Defined constant - tie_str, winner_str	
## Use these string in your solution to avoid misspelled strings
tie_str = "There is a tie"
winner_str = "Player %d is the winner with %d points"

##----------------------------------------------------------------------
## Helper Function

# str_points: (listof (union "bear", "hat", "cupcake", "shoe")[nonempty] -> 
# (listof int[>=0])

# Purpose: produces the sum of corresponding integers as the given 
# string list(alos)

# Effect: no effect since there is no mutation

def str_points(alos):
        if alos == []:
                return 0
        elif alos[0] == "bear":
                return 10 + str_points(alos[1:])
        elif alos[0] == "hat":
                return 5 + str_points(alos[1:])
        elif alos[0] == "cupcake":
                return 2 + str_points(alos[1:])
        elif alos[0] == "shoe":
                return str_points(alos[1:])
        

##-----------------------------------------------------------------------

## Main Function 

# bhcs_game: (listof (list of (union "bear","hat","cupcake","shoe"))
# [len=4])[nonempty] -> str

# Purpose: produces a string indicating the winner of the game with winning
# points or a tie

# Effect: no effect

# Examples: bhcs_game([["cupcake","hat","shoe","bear"]]) => 'Player 1 is the
# winner with 17 points'
# bhcs_game([["cupcake","hat","shoe","shoe"],["shoe","hat","shoe","cupcake"]])
# => "There is a tie"
# bhcs_game([["shoe","hat","hat","cupcake"], ["cupcake","hat","shoe","bear"]])
# => "Player 2 is the winner with 17 points"

def bhcs_game(die_rolls):
        point_roll = map(str_points, die_rolls)
        winner_points = max(point_roll)
        player = point_roll.index(winner_points) + 1
        check_tie = filter (lambda int: int == winner_points, point_roll)
        if len(check_tie) == 1:
                return winner_str % (player, winner_points)
        else:
                return tie_str
        
# Tests
## base case
check.expect("Q3T1", bhcs_game([["cupcake","hat","shoe","bear"]]), \
             "Player 1 is the winner with 17 points")
## tie 
check.expect("Q3T2", bhcs_game([["cupcake","hat","shoe","shoe"], \
                                ["shoe","hat","shoe","cupcake"]]), \
             "There is a tie")
check.expect("Q3T3", bhcs_game([["cupcake","hat","shoe","bear"], \
                                ["cupcake","hat","shoe","bear"], \
                                ["hat","cupcake","bear","shoe"]]), \
             "There is a tie") 
## other
check.expect("Q3T4", bhcs_game([["shoe","hat","hat","cupcake"], \
                                ["cupcake","hat","shoe","bear"]]),\
             "Player 2 is the winner with 17 points")
check.expect("Q3T5", bhcs_game([["bear","shoe","shoe","hat"], \
                                ["cupcake","bear","shoe", "hat"], \
                                ["bear","bear","bear","bear"], \
                                ["cupcake","cupcake","hat","hat"]]), \
             "Player 3 is the winner with 40 points")
