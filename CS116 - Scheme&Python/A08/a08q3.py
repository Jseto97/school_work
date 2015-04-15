import check

## Question 3

##--------------------------------------------------------------------
## Helper Function

# str_search: str (listof str) -> bool

# Purpose: produces a boolean showing if the given string (word) is 
# in the given string list (alos)

def str_search(word, alos):
    for string in alos: 
        if word in string:
            return True

##--------------------------------------------------------------------

# search_docements: (listof str) -> None

# Purpose: produces none by consuming the list of string(documents)

# Effect: prints the string that contains the required string input from
# the interaction window

# Examples: 
# search_documents(["The brown dog jumped.", "He jumped over the log.",
# "A dog, cat, or rabbit would make a good pet."])

def search_documents(documents):
    key_word = raw_input("Query:")
    words = key_word.split()
    for str in documents:
        for word in words:
            if word in str:
                print str
        
# Tests
## base case
