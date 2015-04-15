import check

## Question 2

# collatz_list: int[>0] -> (listof int[>0])

# Purpose: produces a list of integers after a series of caculations
# from the given integer (n)

# Effect: no effect since there is no mutation

# Examples: collatz_list(1) => [1]
# collatz_list(2) => [2,1]
# collatz_list(3) => [3,10,5,16,8,4,2,1]
# collatz_list(8) => [8,4,2,1]

def collatz_list(n):
    initial = []
    while n > 1:
        initial = initial + [n]
        if n % 2 == 1:
            n = 3*n + 1
        else:
            n = n/2
    return initial+[1]

# Tests
## base case
check.expect('q2t1', collatz_list(1), [1])
## small numbers
check.expect('q2t2', collatz_list(2), [2,1])
check.expect('q2t3', collatz_list(3), [3,10,5,16,8,4,2,1])
check.expect('q2t4', collatz_list(4), [4,2,1])
check.expect('q2t5', collatz_list(6), [6,3,10,5,16,8,4,2,1])
## large number
check.expect('q2t6', collatz_list(25), [25,76,38,19,58,29,88,44,22,11,\
                                        34,17,52,26,13,40,20,10,5,16,8,4,2,1])