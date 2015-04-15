## CS116 Assignment 05
## Question 1

# import
import check
from math import sqrt

## (a)
##--------------------------------------------------------------------
## Helper Function

# accum: int int int int -> int

# Purpose: produces an integer by consuming integers (n0),(last_fib),
# (prev_fib), and (n)

# Effect: mutates n0 by adding one value each time, last_fib is replaced
# by the sum of last_fib and prev_fib, prev_fib is replaced by last_fib,
# but no effect on n

# Examples: accum(0,0,0,0) => 0
# accum(0,1,1,1) => 2
# accum(1,2,3,3) => 7
# accum(2,3,5,4) => 11

def accum(n0, last_fib, prev_fib, n):
    if n0 == n:
        return last_fib
    else:
        return accum ((n0 + 1), 
                      (last_fib + prev_fib),
                       last_fib, n)

# Tests
check.expect("HelperT1", accum(0,0,0,0), 0)
check.expect("HelperT2", accum(0,1,1,1), 2)
check.expect("HelperT3", accum(1,2,3,3), 7)
check.expect("HelperT4", accum(2,3,5,4), 11)

##--------------------------------------------------------------------

## Main Function

# acc_fib: int -> int

# Purpose: produces the (n)th Fibonacci number

# Effect: no effect since there is no mutation

# Examples: acc_fib(0) => 0
# acc_fib(1) => 1
# acc_fib(3) => 2
# acc_fib(5) => 5
# acc_fib(8) => 21

def acc_fib(n):
    if n == 0:
        return 0
    else:
        return accum (1,1,0,n)

# Tests
check.expect("Q1T1", acc_fib(0), 0)
check.expect("Q1T2", acc_fib(1), 1)
check.expect("Q1T3", acc_fib(3), 2)
check.expect("Q1T4", acc_fib(5), 5)
check.expect("Q1T5", acc_fib(8), 21)
check.expect("Q1T6", acc_fib(10), 55)

##**********************************************************************
## (b)

# approx_fib: int -> int

# Purpose: produces the approximate nth Fibonacci number, which is an
# integer by consuming the given integer (n)

# Example: approx_fib(0) => 0
# approx_fib(1) => 1
# approx_fib(2) => 1
# approx_fib(10) => 55

def approx_fib(n):
    phi = (1 + sqrt(5)) / 2
    tau = (1 - sqrt(5)) / 2
    return int ((phi**n - tau**n) / sqrt(5))

# Tests for approx_fib
check.expect("Q1bT1", approx_fib(0), acc_fib(0))
check.expect("Q1bT2", approx_fib(1), acc_fib(1))
check.expect("Q1bT3", approx_fib(2), acc_fib(2))
check.expect("Q1bT4", approx_fib(5), acc_fib(5))
check.expect("Q1bT5", approx_fib(8), acc_fib(8))
check.expect("Q1bT6", approx_fib(10), acc_fib(10))
