// alltime_gcd.c

int gcd(int n,int m){
    int temp;
    while (m != 0) {
    temp = n;
    n = m;
    m = temp%m;
    }
return n;
}

int alltime_gcd(int integer){
    


