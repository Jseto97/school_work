// findmax.c
// module dealing with int pointers

/* Helper Function:
  accumulative recursion */
  
int max_val(int(*f)(int), int first, int last, int accum){
    const int out = (first > last) ? accum :
                    ((f(first) > f(accum)) ? 
                    max_val(*f, first+1, last, first) :
                    max_val(*f, first+1, last, accum));
    return out;
}

int find_max_pos(int (*f)(int), int a, int b){
    return max_val(*f, a+1, b, a);
}

