def draw_pyramid(size):
    for i in range(size-1):
        print (size-i-2)*" ",
        for n in range(i):
            print "*",
        print "*"
    for l in range(size):
        print "*",

