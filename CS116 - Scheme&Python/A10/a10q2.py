import check

# Question 2

##--------------------------------------------------------------------
## Helper Function

# day_trans: (union 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday')
# -> int[>=0,<=6]

# Purpose: produces an integer corresponding to the possible position
# of the given string (day) in the weekday information

# Effect: no effect since there is no mutation

def day_trans(day):
    if day == 'Monday':
        return 0
    elif day == 'Tuesday':
        return 1
    elif day == 'Wednesday':
        return 2
    elif day == 'Thursday':
        return 3
    elif day == 'Friday':
        return 4
    elif day == 'Saturday':
        return 5
    else:
        return 6
 
##--------------------------------------------------------------------

## Main Function

day_string = "Top Shows airing on %s\n"

# ratings_by_day: str[nonempty] (union 'Monday' 'Tuesday' 'Wednesday' 
# 'Thursday' 'Friday') -> None

# Purpose: consumes a file name(ratings_file) and a str as a day of the
# week(day_of_week) and produces None

# Effect: opens the given name of file (ratings_file) and creates a new
# file with name '(day_of_week)-(ratings_file)'

# Examples:
# Set the file 'q2t1.txt', which only contains two lines of the headings
# and no other information, call the function ratings_by_day('q2t1', 
# 'Sunday'), which will produce None and create a file named 'Sunday-
# q2t1', which contains one line 'Top Shows airing on Sunday'
#


def ratings_by_day(ratings_file, day_of_week):
    ## Assume ratings_file exists
    ## reading the file
    infile = file(ratings_file, 'r')
    lst = infile.readlines()
    infile.close()
    
    ## taking the useful part of the file into file_list
    check = day_trans(day_of_week)
    program = map(lambda item: item.split(','), lst)[2:]
    file_list = []
    for shows in program:
        days = shows[3]
        if days[check-1] != '.':
            file_list.append(shows[:2])
    
    ## writing to a file
    filename = day_of_week + '-' + ratings_file
    output_file = file(filename, 'w')
    output_file.write(day_string % day_of_week)
    for seg in file_list:
        output_file.write(seg)
    output_file.close()

# Tests
## base case: the given file only contains the first two lines and
## there is no program data in the file
check.expect('q2t1', ratings_by_day('q2t1.txt', 'Sunday'), None)
check.set_file('Sunday-q2t1.txt', 'q2t1-check.txt')
## other case: the given file contains some of the program infomation
check.expect('q2t2', ratings_by_day('q2t2.txt', 'Tuesday'), None)
check.set_file('Tuesday-q2t2.txt', 'q2t2-check.txt')
## case that data in the given file has no programs on the given day
check.expect('q2t3', ratings_by_day('q2t3.txt', 'Sunday'), None)
check.set_file('Sunday-q2t3.txt', 'q2t3-check.txt')