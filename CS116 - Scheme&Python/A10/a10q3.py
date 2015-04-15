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

# QUESTION 3

# get_songs: str[nonempty] -> (dictof str[nonempty] (listof concert)[nonempty])

# Purpose: consumes a string representing the name of the given file and
# produces a dictionary which has string of songs as the keys and list of
# concert related to the song as the value

# Effect: reads the given file (setlists) 

# Examples:

 
def get_songs(setlists):
    rmv = '\n'
    ## open the file and read it
    infile = file(setlists, 'r')
    next_str = infile.readline()
    song_list = []
    concert_list = []
    songs = []
    while (next_str != ''):
        ## remove the extra '\n' lines
        if next_str != rmv:
            ## remove ' \n' in the string
            if rmv in next_str:
                index = next_str.index(rmv)
                next_str = next_str[:index] + next_str[index+1:]
            ## make the list of concert information for further editing
            if next_str[:4].isdigit() :
                concert_list.append(next_str)
            ## make the list of songs for further editing
            else: 
                song_list.append(next_str[:-1])
                songs.extend(next_str[:-1])
        next_str = infile.readline()
    infile.close()
    ## make the list of all concert
    value_list = []
    for conc in concert_list:
        lst = conc.split(' - ')
        date = lst[0]
        date = date.split('-')
        year = int(date[0])
        month = int(date[1])
        day = int(date[2])
        place = lst[1]
        value_list.append(concert(year,month,day,place))
    ## making the dictionary as going through the song_list
    out_dict = {}
    songs = reduce(lambda s,slst: s+slst, filter(lambda item: \
                                                 not item in lst,songs))
    for con in value_list:
        ind = value_list.index(con)
        for song in songs:
            out_dict[song] = filter(lambda item: song in song_list[ind], \
                                    value_list)
    return out_dict
   


# Tests