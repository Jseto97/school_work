import check

## Question 4

##--------------------------------------------------------------------
## Helper Function

# list_median: (listof int)[nonempty] -> int

# Purpose: produces the median number from the given list(alon)
# by the algorithm from the question

# Effect: no effect

# Examples: list_median([1]) => 1
# list_median([1,2]) => 1
# list_median([2,3,5,5]) => 4
# list_median([1,2,3,5,8]) => 3

def list_median(alon):
    length = len(alon)
    if length % 2 == 1:
        return alon[length/2]
    else:
        left = alon[length/2-1]
        right = alon[length/2]
        median = (left+right) / 2
        return median
        
##--------------------------------------------------------------------

# find_median: (listof int)[nonempty] (listof int)[nonempty] -> int

# Purpose: produces an integer as the median number from the two given
# integer lists(lst1)(lst2) by some algorithm

# Effect: no effect since there is no mutation

# Examples: find_median([4],[3]) => 3
# find_median([4,6],[3,4]) => 4
# find_median([4,6,7],[3,4,5]) => 4
# find_median([1,12,15,19],[2,13,17,19]) => 14

def find_median(lst1,lst2):
    med1 = list_median(lst1)
    med2 = list_median(lst2)
    l1 = len(lst1)
    if l1 == 1:
        mid = (med1+med2) / 2
        return mid
    elif l1 == 2:
        mid = (max(lst1[0],lst2[0]) + min(lst1[1],lst2[1])) / 2
        return mid
    elif med1 > med2:
        if l1 % 2 == 1:
            lst1 = lst1[:l1/2+1]
            lst2 = lst2[l1/2:]
            return find_median(lst1,lst2)
        else:
            lst1 = lst1[:l1/2+1]
            lst2 = lst2[l1/2-1:]
    elif med1 < med2:
        if l1 % 2 == 1:
            lst1 = lst1[l1/2:]
            lst2 = lst2[:l1/2+1]
            return find_median(lst1,lst2)
        else:
            lst1 = lst1[l1/2-1:]
            lst2 = lst2[:l1/2+1]
            return find_median(lst1,lst2)
    else:
        return med1

# Tests
## base case: one element
check.expect("q4t1", find_median([4],[3]), 3)
## two elements
check.expect("q4t2", find_median([4,6],[3,4]), 4)
## longer lists
check.expect("q4t3", find_median([4,6,7],[3,4,5]), 4)
check.expect("q4t4", find_median([1,12,15,19],[2,13,17,19]), 14)
## much longer cases
check.expect("q4t5", find_median([1,2,3,4,5,6,7,8,9],[2,3,4,5,6,7,9,10,12]), 5)