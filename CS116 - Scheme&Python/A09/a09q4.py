import check

## Question 4

cmd_prompt = 'Enter a command: '
first_var = 'Enter the first variable: '
second_var = 'Enter the second variable: '
inc_var = 'Which variable to increment: '
dec_var = 'Which variable to decrement: '

# memory: (dictof str int)[nonempty] -> None

# Purpose: consumes a dictionary of strings and integers and produces nothing

# Effect: the function requires the user to enter a command until the command
# is "Q"
# - If the command is Q, the program will print out all the keys and values
#   in (D) one by one in two lines
# - If the command is G, the program will ask for two more variable names
#   existing in (D) and print True if the first key has a value greater
#   than the second key and print False otherwise
# - If the command is L, the program will ask for two more variable names
#   existing in (D) and print True if the first key has a value smaller
#   than the second key and print False otherwise
# - If the command is E, the program will ask for two more variable names
#   existing in (D) and print True if the first key has a value equal to
#   the second key and print False otherwise
# - If the command is I, the program will ask for a variable name that the
#   value associated with the key will be increased by 1. If there is no 
#   key in (D), nothing will happen
# - If the command is D, the program will ask for a variable name that the
#   value associated with the key will be decreased by 1. If there is no 
#   key in (D), nothing will happen
# - If the command is A, the program will print the average of all the values
#   in (D) and rounded to two decimal places

# Examples:
# call the function memory({'bob':3,'ed':5,'mary':4}), input a command 'G';
# then the program asks to input a first variable, enter mary; the program
# asks second variable, enter bob; the program prints out False and asks for
# a command, input L; the program asks for first variable, enter mary; the
# program asks for second variable, enter ed; prints out True and asks for
# a command, input E; the program ask for a first variable, enter ed; the 
# program asks for a second variavble, input mary; the program prints out
# False and ask for a command, input I; the program asks for a variable to
# increase, input 'mary', the value associated with 'mary' becomes 5; the 
# program asks for a command, input D; the program asks a variable to decrease,
# input 'bob'; the value associated with 'bob' becomes 2; the program asks 
# for a command, input 'A', it prints out '4.00' and asks for a command; input
# 'Q', and the program prints 'bob 2 ed 5 mary 5'

def memory(D):
    cmd = raw_input(cmd_prompt)
    while cmd != 'Q':
        if cmd == 'G':
            left = D[raw_input(first_var)]
            right = D[raw_input(second_var)]
            print left > right
        if cmd == 'L':
            left = D[raw_input(first_var)]
            right = D[raw_input(second_var)]
            print left < right
        if cmd == 'E':
            left = D[raw_input(first_var)]
            right = D[raw_input(second_var)]
            print left == right
        if cmd == 'I':
            tar_inc = raw_input(inc_var)
            if D.has_key(tar_inc):
                value = D.pop(tar_inc)
                D.update({tar_inc: value+1})
        if cmd == 'D':
            tar_dec = raw_input(dec_var)
            if D.has_key(tar_dec):
                value = D.pop(tar_dec)
                D.update({tar_dec: value-1})
        if cmd == 'A':
            all_value = reduce(lambda x,y: x+y, D.values())
            count = len(D)
            outcome = float(all_value)/count
            print '%.2f' %outcome 
        cmd = raw_input(cmd_prompt)
    for key in sorted(D):
        value = str(D[key])
        print key, value
            
# Test
## average of the values in dictionary
D = {'mary':6,'bob':3}
check.set_input(['A'])
check.set_screen(4.50)
check.expect('q4t1a', memory(D), None)
check.expect('q4t1b', D, D)
## increse one of the value in dictionary by 1
check.set_input(['I', 'mary'])
check.expect('q4t2a', memory(D), None)
check.expect('q4t2b', D, {'mary':7,'bob':3})
## compare the two key values, G
check.set_input(['G', 'mary','bob'])
check.set_screen(True)
check.expect('q4t3a', memory(D), None)
check.expect('q4t3b', D, D)
## compare the two key values, L
check.set_input(['L', 'mary','bob'])
check.set_screen(False)
check.expect('q4t4a', memory(D), None)
check.expect('q4t4b', D, D)
## compare the two key values, E
check.set_input(['E', 'mary','bob'])
check.set_screen(False)
check.expect('q4t5a', memory(D), None)
check.expect('q4t5b', D, D)
## decrese one of the value in dictionary by 1
check.set_input(['D', 'mary'])
check.expect('q4t6a', memory(D), None)
check.expect('q4t6b', D, {'mary':6,'bob':3})
## output the keys and values in D
check.set_input(['Q'])
check.set_screen('bob 3 mary 6')
check.expect('q4t7a', memory(D), None)
check.expect('q4t7b', D, D)
