import check

## Question 3

# coin_change: (listof int[>0])[nonempty] int[>0] -> (listof (listof int)[len=2])

# Purpose: produces a list of lists with two integers representing the value of
# coins and the number of coins from (avail_change) as the sum of them is the
# value of (total_cents)

# Effect: no effect since there is no mutation

# Examples: coin_change([1],20) => [[1,20]]
# coin_change([25,5,1],35) => [[25,1],[5,2]]
# coin_change([10,5,1],25) => [[10,2],[5,1]]
# coin_change([90,85,20,1],108) => [[90,1],[1,18]]

def coin_change(avail_change, total_cents):
        outcome = []
        for coin in avail_change:
                while total_cents>0 and coin<=total_cents:
                        outcome.append([coin, total_cents/coin])
                        total_cents = total_cents%coin
        return outcome
# Tests
## base case
check.expect("q3t1", coin_change([1],20), [[1,20]])
## case that only first coin value is used
check.expect("q3t2", coin_change([25,5,1],100), [[25,4]])
check.expect("q3t3", coin_change([50,25,10,5,1],200), [[50,4]])
## case that all coin values in the list are used
check.expect("q3t4", coin_change([50,5,1],108), [[50,2],[5,1],[1,3]])
## that some of the coin values are used
check.expect("q3t5", coin_change([10,5,1],25), [[10,2],[5,1]])
check.expect("q3t6", coin_change([90,85,20,1],108), [[90,1],[1,18]])