import check

## Question 4

# merge_tables: (listof (listof any)) -> (listof (listof any))

# Purpose: produces a list of merged tables by combining the values of
# tables with the same label in (table1) and (table2)

# Effect: no effect since there is no mutation

# Examples: merge_tables([],[]) => []
# merge_tables([],['a',1]) => [['a',1]]
# merge_tables(['a',1],[]) => [['a',1]]
# merge_tables(['a',1],['a',True]) => [['a',1,True]]
# merge_tables([['a',1],['b',2]], [['a',True],['c',False]])
# => [['a',1,True],['b',2,None],['c',None,False]]

def merge_tables(table1, table2):
    new=[]
    non=[]
    tl1=[]
    tl2=[]
    nonon=[]
    adden=[]       
    for x in table2:
        tl2+=x[0]
    for x in table1:
        tl1+=x[0]
    for n in table2[0]:
        non+=[None]
    for n in table1[0]:
        nonon+=[None]
    non=non[1:]
    nonon=nonon[1:]
    for n in range(len(tl2)):
        x=tl2[n]
        if x not in tl1:
            adden+=[[x]+nonon+l2[n][1:]] 
    for x in table1:
        add=[]
        for y in table2:
            if x[0]==y[0]:
                add+=[x+y[1:]]         
        if add==[]:
            new+=[x+non]
        else:
            new+=add
    return new+adden

# Tests
## base cases
check.expect('q4t1', merge_tables([],[]), [])
check.expect('q4t2', merge_tables([],['a',1]), [['a',1]])
check.expect('q4t3', merge_tables(['a',1],[]), [['a',1]])
## single element
check.expect('q4t4', merge_tables(['a',1],['a',True]), [['a',1,True]])
check.expect('q4t5', merge_tables(['a',1],['b',True]), \
             [['a',1,None], ['b',None,True]])
check.expect('q4t6', merge_tebles(['a',1],['b',2]), [['a',1,None],['b',None,2]])
## more complex cases
check.expect('q4t7', merge_tables([['a',1],['b',2]], [['a',True],['c',False]]),\
             [['a',1,True],['b',2,None],['c',None,False]])
check.expect('q4t8', merge_tables([["A",11],["B",22],["D",33],["D",44], \
                                   ["E", 55]],[["A",True,5.0],["B",False,8.0],\
                                               ["C",True,4.0],["D", False,2.0], \
                                               ["D",True, 1.0]]),\
             [["A",11,True,5.0],["B",22,False,8.0],["D",44,False,2.0],\
              ["D",44,True,1.0],["D",33,False,2.0],["D",33,True, 1.0],\
              ["C",None,True,4.0],["E",55,None,None]])