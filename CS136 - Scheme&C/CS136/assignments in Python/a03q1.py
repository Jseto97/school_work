def ones(i):
    if i == 1:
        return 1
    elif i == 0:
        return 0
    elif i%2 == 1:
        return 1 + ones(i/2)
    else:
        return ones(i/2)