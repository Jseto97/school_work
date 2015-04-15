## CS 116 Assignment 5
## Question 2

# import
import check

# trip_cost: int int int int int (union "Day" "After_3") -> float

# Purpose: produces the cost of thr trip as the given number of 
# people (group_a) (group_b) (group_c) (adults) (members) will 
# come to the trip and the ticket price depends on the visiting
# (time)

# Effect: no effect

# Examples for trip_cost
# trip_cost(0,0,0,0,0,"Day") => 0
# trip_cost(1,1,1,1,1,"Day") => 32.43
# trip_cost(40,55,29,33,13,"After_3") => 582.59
# trip_cost(20,15,29,35,05,"Day") => 995.18
# trip_cost(40,40,40,40,0, "Day") => 1271.40

def trip_cost (group_a, group_b, group_c, adults, members, time):
    ## cost of group a
    if group_a <= 30:
        cost_a = 5.00*group_a
    elif group_a > 30:
        cost_a = 5.00*30
    ## cost of group b
    if group_b <= 30:
        cost_b = 8.00*group_b
    elif group_b > 30:
        cost_b = 8.00*30
    ## cost of group c with tax
    if group_c <= 30:
        cost_c = 10.00*group_c*1.13
    elif group_c > 30:
        cost_c = 10.00*30*1.13
    ## cost of adults with tax and the total cost depending on the time
    if time == "Day":
        adult_cost = (members*12.00*0.6 + (adults-members)*12.00) *1.13
        total_cost = cost_a + cost_b + cost_c + adult_cost
        return total_cost
    elif time == "After_3":
        adult_cost = adults*12.00*0.5*1.13
        total_cost = (cost_a + cost_b + cost_c)*0.5 + adult_cost
        return total_cost
    
# Tests
check.within("Q2T1", trip_cost(0,0,0,0,0, "Day"), 0, 0.01)
check.within("Q2T2", trip_cost(1,1,1,1,1, "Day"), 32.43, 0.01)
check.within("Q2T3", trip_cost(1,1,1,1,1, "After_3"), 18.93, 0.01)
check.within("Q2T4", trip_cost(40,55,29,33,13,"After_3"), 582.59, 0.01)
check.within("Q2T5", trip_cost(20,15,29,35,05,"Day"), 995.18, 0.01)
check.within("Q2T6", trip_cost(40,40,40,40,0, "Day"), 1271.40, 0.01)
check.within("Q2T7", trip_cost(25,15,20,30,10,"Day"), 823.56, 0.01)
check.within("Q2T8", trip_cost(10,10,10,10,5,"After_3"), 189.30, 0.01)
check.within("Q2T9", trip_cost(50,50,50,50,25, "After_3"), 703.50, 0.01)