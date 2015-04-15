int ones(int i){
    const int c = (i<2)? ((i == 1) ? 1 : 0) 
                  : ((i%2==1) ? 1+ones(i/2) : ones(i/2));
    return c;
}
