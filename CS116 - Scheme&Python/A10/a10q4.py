import check

##--------------------------------------------------------------------
## data definitions
class concert:
    ''' A concert is an object concert(year, month, day, location), where
        year is a positive integer (the year the concert was held),
        month is an integer between 1 and 12 (the month the concert was held),
        day is an integer between 1 and 31 (the day the concert was held), and
        location is a nonempty string (the building and city where the concert was held)'''
    
    # Constructor
    # __init__: int[>0] int[>=1,<=12] int[>=1,<=31] str -> concert
    # Produces a new concert object, that occurred on year y, month m, day d, at where.
    # Usage: concert(2013, 3, 8, "Toronto") creates a concert object c, where
    # c.year = y, c.month = m, c.day = d, and c.location = where.
    def __init__(self, y,m,d,where):
        self.year = y
        self.month = m
        self.day = d
        self.location = where
        
    # __repr__: concert -> str[len>0]
    # Produces a string representation of a concert c, of the form "dd/mm/yyyy: place" -
    # if d < 10 or m < 10, then a leading space is printed for dd/mm.
    # Usage: this function is called automatically for both of the following situations:
    # print c
    # str(c)
    # where c is a concert object.
    def __repr__(self):
        return "%2d/%2d/%4d: %s" % (self.day, self.month, self.year, self.location)
    
    # __eq__: concert any -> bool
    # Produces True if other is a concert and all fields match concert, and False otherwise
    # Usage: this function is called automatically for the expression
    # c == d
    # where c is a concert object
    def __eq__(self, other):
        return type(self)==type(other) and self.year==other.year and \
               self.month==other.month and self.day==other.day and \
                self.location==other.location
    
    # __ne__: concert any -> bool
    # Produces False if self==other, and True otherwise.
    # Usage: this function is called automatically for the expression
    # c != d
    # where c is a concert object
    def __ne__(self, other):
        return not(self==other)

##--------------------------------------------------------------------
    
# QUESTION 4

# organize_songs: (dictof str[nonempty] concert) str -> None

# Purpose: produces None by consuming a dictionary of songs (songs) and 
# a string representing the name of a file (output_file)

song_format = "%s performed %d time(s) at:\n"
def organize_songs(songs, output_file):
    pass