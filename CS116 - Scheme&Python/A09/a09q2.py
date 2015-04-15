import check

## Question 2

##--------------------------------------------------------------------
## data definitions
class card:
    ''' A card is an object card(suit, value) where
     * suit is one of 'clubs', 'spades', 'diamonds', 'hearts', and
     * value is an integer in the range 1..10'''
    
    # __init__ sets the fields of the object to the consumed values
    # Note: values of suit and value must satisfy data definition    
    def __init__(self, s, v):
        self.suit = s
        self.value = v
    
    # __repr__ produces a string representation of the card object
    # This will be the format used by print        
    def __repr__(self):
        return "%s of %s" % (self.value, self.suit)
    
    # __eq__ produces True if card objects self and other pass the equality test
    # and False otherwise    
    def __eq__(self, other):
        return type(self) == type(other) and self.suit == other.suit \
		and self.value == other.value
    
    # __ne__ produces True if card objects self and other do not represent the
    # same card, and False if they do    
    def __ne__(self, other):
        return not(self == other)
    
##--------------------------------------------------------------------

output_string = "Go Fish!"

# go_fish: (listof card) int[>0] -> None

# Purpose: produces none by consuming a list of cards(hand) and a 
# positive integer (v)

# Effect: mutates the given card list (hand) by removing all card with 
# value equal to the given integer(v). If there is no cards matching,
# the function will print "Go Fish!"

# Examples:
# If L = {}, call go_fish(L,2) should produce None but print 'Go Fish!',
# and L remains the same
# If L = [card('spades',8),card('hearts',5),card('diamonds',6),card('clubs',5)],
# call go_fish(L,9) should produce None but print 'Go Fish!',
# and L remains the same
# If L = [card('spades',8),card('hearts',5),card('diamonds',6),card('clubs',5)],
# call go_fish(L,5) should produce None and L becomes [card('spades',8), 
# card('diamonds',6)]

def go_fish(hand, v):
    count = 0
    for card in hand:
        if card.value == v:
            hand.remove(card)
            count = count + 1
    if count == 0:
        print output_string

# Tests
## base case: given list is an empty list
L = []
check.set_screen(output_string)
check.expect('q2t1a', go_fish(L,2), None)
check.expect('q2t1b', L, L)
## case when there is no card with the given integer
L = [card('spades',8),card('hearts',5),card('diamonds',6),card('clubs',5)]
check.set_screen(output_string)
check.expect('q2t2a', go_fish(L,9), None)
check.expect('q2t2b', L, L)
## case when the given list is mutated
L = [card('spades',8),card('hearts',5),card('diamonds',6),card('clubs',5)]
new_list = [card('spades',8), card('diamonds',6)]
check.expect('q2t3a', go_fish(L,5), None)
check.expect('q2t3b', L, new_list)
## a longer list
## mutation
L = [card('hearts',6), card('spades',10), card('spades',2), card('clubs',8), \
     card('hearts',2), card('diamonds',3), card('clubs', 2), card('diamonds',2),\
     card('spades',7), card('hearts',5), card('diamons',4), card('clubs',3)]
check.expect('q2t4a', go_fish(L,2), None)
new_list = [card('hearts',6),card('spades',10),card('clubs',8),card('diamonds',3),\
            card('spades',7),card('hearts',5),card('diamons',4),card('clubs',3)]
check.expect('q2t4b', L, new_list)
## no mutation
L = [card('hearts',6), card('spades',10), card('spades',2), card('clubs',8), \
     card('hearts',2), card('diamonds',3), card('clubs', 2), card('diamonds',2),\
     card('spades',7), card('hearts',5), card('diamons',4), card('clubs',3)]
check.expect('q2t5a', go_fish(L,9), None)
check.set_screen(output_string)
check.expect('q2t5b', L, L)