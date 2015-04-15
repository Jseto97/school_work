#---------------------------------------------------------------------
## required class
class tile:
    ''' A card is an object tile(length width) where
     * length is an integer representing the length of one side of tile
     * width is an integer representing the length of another side of tile'''
    
    # __init__ sets the fields of the object to the consumed values
    # Note: values of length and width must satisfy data definition    
    def __init__(self, l, w):
        self.length = l
        self.width = w
    
    # __repr__ produces a string representation the area of the tile
    # This will be the format used by print        
    def __repr__(self):
        return "%d x %d" % (self.length, self.width)
    
    # __eq__ produces True if card objects self and other pass the equality test
    # and False otherwise    
    def __eq__(self, other):
        return type(self) == type(other) and self.length == other.length \
		and self.width == other.width
    
    # __ne__ produces True if card objects self and other do not represent the
    # same card, and False if they do    
    def __ne__(self, other):
        return not(self == other)
#---------------------------------------------------------------------
class price:
    ''' A price is an object price(unit, quantity, bulk) where
     * unit is an integer representing the cost of one tile
     * quantity is an integer representing the number of tiles in a bulk
     * bulk is an integer indicating the price of a bulk of tiles'''
    
    # __init__ sets the fields of the object to the consumed values
    # Note: values of suit and value must satisfy data definition    
    def __init__(self, u, q, b):
        self.unit = u
        self.quant = q
        self.bulk = b
    
    # __repr__ produces a string representation of the card object
    # This will be the format used by print        
    def __repr__(self):
        return "$%d, %d in $%d" % (self.unit, self.quant, self.bulk)
    
    # __eq__ produces True if card objects self and other pass the equality test
    # and False otherwise    
    def __eq__(self, other):
        return type(self) == type(other) and self.unit == other.unit \
		and self.quant == other.quant and self.bulk == other.bulk
    
    # __ne__ produces True if card objects self and other do not represent the
    # same card, and False if they do    
    def __ne__(self, other):
        return not(self == other)
#---------------------------------------------------------------------

def try1(rooml, roomw, num):
    length = max(num.length, num.width)
    width = min(num.length, num.width)
    if rooml%length == 0:
        a = rooml/length
    else:
        a = rooml/length + 1
    if roomw%width == 0:
        b = roomw/width
    else:
        b = roomw/width + 1
    return a*b

def try2(rooml, roomw, num):
    length = min(num.length, num.width)
    width = max(num.length, num.width)
    if rooml%length == 0:
        a = rooml/length
    else:
        a = rooml/length + 1
    if roomw%width == 0:
        b = roomw/width
    else:
        b = roomw/width +1
    return a*b

def num_tiles(rooml, roomw, num):
    return min(try1(rooml,roomw,num),\
               try2(rooml,roomw,num))

def wastage(rooml, roomw, num):
    tile_area = num.length * num.width * num_tiles(rooml,roomw,num)
    room_area = rooml*roomw
    percent = 1 - room_area*100/tile_area
    return percent

def tile_cost(rooml, roomw, num, p):
    t = num_tiles(rooml,roomw,num)
    group = t/p.quant
    if t%p.quant == 0:
        price = group*p.bulk
        return price
    else:
        price1 = group*p.bulk + (t%p.quant)*p.unit
        price2 = (group+1)*p.bulk
        if price1 < price2:
            return price1
        else:
            return price2