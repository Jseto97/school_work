import math
import check 

# Question 1

## Defined constant - prompts
## Use these string in your solution to avoid misspelled prompts
q1prompt1 = "Enter the email message: "
q1prompt2 = "Enter the word to find: "

##--------------------------------------------------------------------
## Helper Function

# count_word: str str int[>=0] -> int[>=0]

# Purpose: produces an integer(n) as the number of occurence of the 
# given string (word) in the given string (message)

# Effect: mutates (message) starting at the last common letter and
# add 1 to the count number (n) every time when the given string (word)
# is in the given string (message)

def count_word(word, message, n):
	if len(word) == 0:
		return n
	elif len(message) < len(word):
		return n
	elif word in message:
		start = message.find(word)
		message = message[start+1:]
		n = n+1
		return count_word(word, message, n)
	else:
		return n
	
##--------------------------------------------------------------------

## Main Function

# find_email: None -> None

# Purpose: produces None by consuming None

# Effect: receives interact input and prints out the occurence of (word)
# in (message)

# Examples: If calling function and inputing message "" and word "", then
# it prints 0 on the screen;
# If calling function and inputing message "a" and word "", then it prints
# 0 on the screen;
# If calling function and inputing message "aaaaaa" and word "aa", then it 
# prints 5 on the screen;
# If calling function and inputing message "banana" and word "ana", then it 
# prints 2 on the screen;
 
def find_email():	
	message = raw_input(q1prompt1)
	word = raw_input(q1prompt2)
	print count_word(word, message, 0)

	
# Tests
## First test: base case
check.set_input(["",""])
check.expect("Q1T1", find_email(), None)
check.set_screen(0)
## test with empty string in message
check.set_input(["", "a"])
check.expect("Q1T2", find_email(), None)
check.set_screen(0)
## test with empty string in word
check.set_input(["a", ""])
check.expect("Q1T3", find_email(), None)
check.set_screen(0)
## tests for some normal cases
check.set_input(["banana", "ana"])
check.expect("Q1T4", find_email(), None)
check.set_screen(2)
## another one
check.set_input(["aaaaaa", "aa"])
check.expect("Q1T5", find_email(), None)
check.set_screen(5)
