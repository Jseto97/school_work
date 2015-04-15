import check

# Question 1

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
    
card1 = card('spades', 8)
card2 = card('hearts', 5)
card3 = card('diamonds', 6)
card4 = card('clubs', 5)
    
##--------------------------------------------------------------------

## 1(a)

# red_odd: red_odd: (listof card) => (listof card)

# Purpose: produces a list of cards with red suit('diamonds' or 'hearts')
# and odd value from the given list (hand)

# Effect: no effect since there is no mutation

# Examples: red_odd([]) => []
# red_odd([card1,card4]) => []
# red_odd([card1,card2,card3,card4]) => [card]

def red_odd(hand):
    new_list = filter(lambda c: c.value % 2 == 1 and \
                      (c.suit == "diamonds" or c.suit == "hearts"), hand)
    return new_list

# Tests
## base case
check.expect('q1at1', red_odd([]), [])
## case with only one element
## neither red suit or odd value
check.expect('q1at2', red_odd([card1]), [])
## red suit but not odd value
check.expect('q1at3', red_odd([card3]), [])
## odd value but not red suit
check.expect('q1at4', red_odd([card4]), [])
## both red suit and odd value
check.expect('q1at5', red_odd([card2]), [card2])
## more complex cases
check.expect('q1at6', red_odd([card1,card4]), [])
check.expect('q1at7', red_odd([card1,card2,card3,card4]), [card2])

##--------------------------------------------------------------------

## 1(b)

# higher_in_rank: card => (listof card)

# Purpose: produces a list of cards which all have higher rank than
# the given card (base_card)

# Effect: no effect since there is no mutation

# Examples: higher_in_rank(card1) => [card('spades', 9), card('spades', 10)]
# higher_in_rank(card('spades', 10)) => []
# higher_in_rank

def higher_in_rank(base_hand):
    initial = []
    if base_hand.suit == 'clubs':
        if base_hand.value == 10:
            base_hand.suit = 'diamonds'
            base_hand.value = 0
        else:
            for i in range(base_hand.value+1,11):
                initial.append(card('clubs', i))
            base_hand.suit = 'diamonds'
            base_hand.value = 0
    if base_hand.suit == 'diamonds':
        if base_hand.value == 10:
            base_hand.suit = 'hearts'
            base_hand.value = 0
        else:
            for i in range(base_hand.value+1,11):
                initial.append(card('diamonds', i))
            base_hand.suit = 'hearts'
            base_hand.value = 0
    if base_hand.suit == 'hearts':
        if base_hand.value == 10:
            base_hand.suit = 'spades'
            base_hand.value = 0
        else:
            for i in range(base_hand.value+1,11):
                initial.append(card('hearts', i))
            base_hand.suit = 'spades'
            base_hand.value = 0
    if base_hand.suit == 'spades':
        if base_hand.value == 10:
            return initial
        else:
            for i in range(base_hand.value+1,11):
                initial.append(card('spades', i))
            return initial
    

# Tests
## base case
check.expect('q1bt1', higher_in_rank(card('spades',10)), [])
## other cases
check.expect('q1bt2', higher_in_rank(card1), [card('spades',9), \
                                              card('spades',10)])
check.expect('q1bt3', higher_in_rank(card2),\
             [card('hearts',6),card('hearts',7),card('hearts',8),\
              card('hearts',9),card('hearts',10),card('spades',1),\
              card('spades',2),card('spades',3),card('spades',4),\
              card('spades',5),card('spades',6),card('spades',7),\
              card('spades',8),card('spades',9),card('spades',10)])