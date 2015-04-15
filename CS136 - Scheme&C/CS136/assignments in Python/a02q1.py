class rational:
    ''' A rational is a rational number with
     * a numerator(num)
     * a denuminator(denom)'''
    
    # __init__ sets the fields of the object to the consumed values
    # Note: values of length and width must satisfy data definition    
    def __init__(self, num, denom):
        self.num = num
        self.den = denom
    
    # __repr__ produces a string representation the area of the tile
    # This will be the format used by print        
    def __repr__(self):
        return "%d / %d" % (self.num, self.den)
    
    # __eq__ produces True if card objects self and other pass the equality test
    # and False otherwise    
    def __eq__(self, other):
        return type(self) == type(other) and self.num == other.num \
		and self.den == other.den
    
    # __ne__ produces True if card objects self and other do not represent the
    # same card, and False if they do    
    def __ne__(self, other):
        return not(self == other)
#---------------------------------------------------------------------

def r_int(i):
    p = rational(i,1)
    return p

def gcd(n, m):
    if m==0:
        return n
    else:
        return gcd(m, n%m)

def r_add(a,b):
    up = a.num*b.den + b.num*a.den
    down = a.den*b.den
    simp = gcd(up,down)
    
    if simp == 1:
        return rational(up,down)
    else:
        return rational(up