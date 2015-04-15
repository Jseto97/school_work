import check

## Question 1

# replace_str: string string -> string

# Purpose: produces a string from the given string (base) replaced by (rep) 
# when (target) is found in (base)

# Effect: mutates (base) when (target) is found in it and replaced by (rep)

# Examples: replace_str('','a','b') => ''
# replace_str('This is my book','a','the') => 'This is my book'
# replace_str('I like this book','I','I') => 'I like this book'
# replace_str('fruit', 'f', 't') => 'truit'
# replace_str('aaaaa','aa','x') => 'xxa

def replace_str(base, target,rep):
        word = len(target)
        if word == 0:
                return base
        if len(base) < word:
                return base
        elif target in base:
                start = base.find(target)
                new_base = base[start+word:]
                new = base[:start] + rep + replace_str(new_base,target,rep)
                return new
        else:
                return base
        
# Tests
## base case
check.expect("q1t1", replace_str('','a','b'), '')
check.expect("q1t2", replace_str('','','a'), '')
check.expect("q1t3", replace_str('','a',''), '')
## single replacement
check.expect("q1t4", replace_str('fruit','f','t'), 'truit')
check.expect("q1t5", replace_str('This is my book','my','the'), \
             'This is the book')
## multiple replacement
check.expect("q1t6", replace_str('aaaaa','aa','x'), 'xxa')
check.expect("q1t7", replace_str('My brother reads books and sometimes he reads magazines', 'reads', 'likes'), \
             'My brother likes books and sometimes he likes magazines')
check.expect("q1t8", replace_str('I like this book','I','I'), 'I like this book')
## no replacement
check.expect("q1t9", replace_str('this is my book','a','the'), 'this is my book')