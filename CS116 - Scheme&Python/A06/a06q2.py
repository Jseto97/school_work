import math
import check 

#Question 2

##--------------------------------------------------------------------
## Helper Function

# grade_list: (listof str) (listof int[>=0,<=100]) (listof (listof 
# str, int[>=0,<=100], (union 'A' 'B' 'C' 'D' 'E'))) -> (listof 
# (listof str, int[>=0,<=100], (union 'A' 'B' 'C' 'D' 'E')))

# Purpose: produces the new mixed list by consuming (name_list)
# (percentage_list), and (new_list)

# Effect: Mutates (new_list) by adding a list with first element from
# the first element of (name_list), second element from the first element
# of (percentage_list), and third element as the corresponding grade symbol
# from the second element

def grade_list(name_list, percentage_list, new_list):
    if name_list == []:
        return new_list
    else:
        append_list = [name_list[0], percentage_list[0]]
        grade = percentage_list[0]
        if grade >= 80:
            append_list = append_list + ['A']
            new_list. append(append_list)
            return grade_list (name_list[1:], percentage_list[1:], new_list)
        elif grade >= 70:
            append_list = append_list + ['B']
            new_list. append(append_list)
            return grade_list (name_list[1:], percentage_list[1:], new_list)
        elif grade >= 60:
            append_list = append_list + ['C']
            new_list. append(append_list)
            return grade_list (name_list[1:], percentage_list[1:], new_list)
        elif grade >= 50:
            append_list = append_list + ['D']
            new_list. append(append_list)
            return grade_list (name_list[1:], percentage_list[1:], new_list)
        else:
            append_list = append_list + ['E']
            new_list. append(append_list)
            return grade_list (name_list[1:], percentage_list[1:], new_list)
    
##--------------------------------------------------------------------

## Main Function

# student_grade: (listof str) (listof int[>=0,<=100]) 
# -> (listof (listof str, int[>=0,<=100],(union 'A' 'B' 'C' 'D' 'E')))

# Purpose: produces a list of lists with mixed string and integer and symbols
# by consuming the name list (full_names) and grade list (percentages)

# Examples: student_grade([], []) => []
# student_grade(["Troy"], [89]) => [["Troy", 89, 'A']]
# student_grade(["Troy" , "Lori" , "Adriel"], [89,84,74]) => [["Troy", 89, 
# "A"], ["Lori", 84, "A"], ["Adriel", 74, "B"]]
# student_grade(["Rosina" , "Maheen" ,"Dan", "EDI"], [72,61,42,52]) 
# => ["Rosina", 72, "B"], ["Maheen", 61, "C"], ["Dan", 42, "E"], 
# ["EDI", 52, "D"]]

def student_grade(full_names,percentages):
    return grade_list(full_names, percentages, [])

# Tests
## base case
check.expect("Q2T1", student_grade([], []), [])
## Test for single element
check.expect("Q2T2", student_grade(["Troy"], [89]), [["Troy", 89, "A"]])
## Test for longer list
check.expect("Q2T3", student_grade(["Troy" , "Lori" , "Adriel"], [89,84,74]),\
             [["Troy", 89, "A"], ["Lori", 84, "A"], ["Adriel", 74, "B"]])
check.expect("Q2T4", student_grade(["Rosina" , "Maheen" ,"Dan", "EDI"], \
                                   [72,61,42,52]),\
             [["Rosina", 72, "B"], ["Maheen", 61, "C"], ["Dan", 42, "E"], ["EDI", 52, "D"]])
check.expect("Q2T5", student_grade (["Troy" , "Lori" , "Adriel", "Rosina" , "Maheen" ,"Dan", "EDI"], \
                                    [89,84,74,72,61,42,52]), \
             [["Troy", 89, "A"], ["Lori", 84, "A"], ["Adriel", 74, "B"], ["Rosina", 72,"B"], \
              ["Maheen", 61, "C"], ["Dan", 42, "E"], ["EDI", 52, "D"]])