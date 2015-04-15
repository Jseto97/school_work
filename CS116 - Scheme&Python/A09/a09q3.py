import check

## Question 3

# in_or_out: (dictof str int[>=0]) str int -> None

# Purpose: produces none by consuming the given dirctionary (D),
# a string (k), and an non-negative integer (t)

# Effect: mutates the given dictionary (D) in several ways:
# - add an entry with {k:0} if (k) is not a key in (D)
# - increment the value associated with (k) by 1 if (k) is in (D)
#   and the value is less than (t)
# - remove the pair when (k) is in (D) and the value associated 
#   with (k) is greater or equal to (t)

# Examples:
# If D = {}, call in_or_out(D,'bob',3), produce None but D becomes
# {'bob':0}
# If D = {'bob':0}, call in_or_out(D,'bob',3), produce None but D 
# becomes {'bob':1}
# If D = {'bob':1}, call in_or_out(D,'mary',4), produce None but D
# becomes {'bob':1,'mary':0}

def in_or_out(D, k, t):
    if not D.has_key(k):
        D.update({k: 0})
    else:
        value = D.pop(k)
        if value < t:
            D.update({k: value+1})


# Tests
##base case: the dictionary is empty
D = {}
check.expect("q3t1a",in_or_out(D,'bob',3), None)
check.expect("q3t1b",D,{'bob':0})
## an entry with key k and value less than t
D = {'bob':0}
check.expect("q3t2a",in_or_out(D,'bob',3),None)
check.expect("q3t2b",D,{'bob':1})
## no entry with key k in the dictionary
D = {'bob':1}
check.expect("q3t3a",in_or_out(D,'mary',4),None)
check.expect("q3t3b",D,{'bob':1,'mary':0})
## an entry with key k and value greater or equal to t
D = {'bob':1,'mary':0}
check.expect("q3t4a",in_or_out(D,'mary',0),None)
check.expect("q3t4b",D,{'bob':1})
## no entry with key k in the dictionary
D = {'bob':1}
check.expect("q3t5a",in_or_out(D,'natalie',6),None)
check.expect("q3t5b",D,{'bob':1,'natalie':0})
## an entry with key k and value less than t
D = {'bob':1,'natalie':0}
check.expect("test6a",in_or_out(D,'bob',3),None)
check.expect("test6b",D,{'natalie':0,'bob':2})