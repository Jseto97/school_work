import check

## Question 1

##--------------------------------------------------------------------
## Helper Function

##********************************************************************

# word_list: str (listof str) -> (listof str int[>0])

# Purpose: consumes a list of string(alos) and a string (word) and 
# produces a list contains the string(word) and the number of occurrence
# in the list(alos)

# Effect: no effect since there is no mutation

def word_list(word, alos):
    count = 0
    for str in alos:
        if word == str:
            count = count + 1
    return [word, count]

##********************************************************************

# remove_duplicates: (listof any) -> (listof any)

# Purpose: produces a list of any type by removing the same element
# in the given alist

def remove_duplicates(alist):
    product = []
    alist.reverse()
    while alist!= []:
        base = alist[0]
        alist = alist[1:]
        if not(base in alist):
            product.append(base)          
    product.reverse()
    return product
        

##--------------------------------------------------------------------

# count_freqs: (listof str) -> (listof (list of str int[>]))

# Purpose: produces a list of lists with a string and an integer
# showing the strings in (los) and its occurrence

# Effect: no effect since there is no mutation

# Examples: count_freqs([]) => []
# count_freqs(["egg"]) => [["egg", 1]]
# count_freqs(["egg", "egg", "spam"]) => [["egg", 2], ["spam", 1"]]

def count_freqs(los):
    base_list = []
    for string in los:
        base_list.append(word_list(string, los))
    outcome = remove_duplicates(base_list)
    return outcome

# Tests
## base case
check.expect('q1t1', count_freqs([]), [])
## case with single element
check.expect('q1t2', count_freqs(["egg"]), [["egg", 1]])
## case with several distinct element
check.expect('q1t3', count_freqs(["egg", "spam", "eggs"]), \
             [["egg", 1], ["spam", 1], ["eggs", 1]])
## cases with more complex situation
check.expect('q1t4', count_freqs(["egg", "egg", "spam"]), \
             [["egg", 2], ["spam", 1]])
check.expect('q1t5', count_freqs(["egg", "bacon", "spam", "spam", "eggs", \
                                  "spam", "bacon","egg", "sausage", "egg", \
                                  "spam", "spam"]), \
             [["egg", 3], ["bacon",2], ["spam", 5], ["eggs", 1], ["sausage", 1]])