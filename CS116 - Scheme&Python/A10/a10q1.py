import check

# Question 1: produce high and low temp, given all temperature readings 
# for a day

# get_low_high: str -> (listof float float)

# Purpose: consumes the name of a file (day_temps) and produces a list
# containing the highest temperature and the lowest temperature in the 
# given file

# Effect: reads from the file (day_temps)

# Example: get_low_high('') => []
# get_low_high('q1t2.txt') => [-8.89,-8.89]
# get_low_high('2003-Jan-17-temps.txt') => [-19.32,-8.68]

def get_low_high(day_temps):
    try:
        input_file = file(day_temps, 'r')
        lst = input_file.readlines()
        data = map(float, map(lambda item: item.split()[4], lst[1:]))
        input_file.close()
        return [min(data), max(data)]
    except:
        return []

# Tests:
## base case: no string input
check.expect('q1t1a', get_low_high(''), [])
## another base case: empty file
check.expect('q1t1b', get_low_high('q1t1'), [])
## case with one day of data in the file
check.expect('q1t2', get_low_high('q1t2.txt'), [-8.89,-8.89])
## case with a short entries of data
check.expect('q1t3', get_low_high('q1t3.txt'), [-15.61, -8.89])
check.expect('q1t4', get_low_high('q1t4.txt'), [-17.63, -15.35])
## case with multiple entries
check.expect('q1t5', get_low_high('2003-Jan-17-temps.txt'), [-19.32,-8.68])