def fib(n):
    first = 0
    second = 1
    accum = 0
    for i in range(n-1):
        accum = first+second
        first = second
        second = accum
    return accum

def fib2(n):
    if n <= 1:
        return n
    else:
        return fib2(n-1)+fib2(n-2)