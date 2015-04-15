// ones.c

int ones_base2(int i){
    if (i == 0) {
        return 0;
    } else {
        int out = 1;
        while (i != 1){
            if (i%2==1){
                out++;
            }
            i/=2;
        }
    return out;
    }
}

int ones_base3(int i){
    int out = 0;
    while (i>=1) {
        if (i%3==1) {
            out++;
        }
        i/=3;
    }
    return out;
}
