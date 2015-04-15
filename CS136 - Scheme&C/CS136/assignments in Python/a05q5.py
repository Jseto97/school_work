def ones_base2(i):
    if i == 0:
        return 0
    else:
        out = 1
        while i != 1:
            if i%2==1:
                out = out+1
            i = i/2
        return out
    
def ones_base3(i):
        out = 0
        while i >= 1:
            if i%3==1:
                out +=1
            i /= 3
        return out