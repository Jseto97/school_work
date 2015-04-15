//PRE: true
//POST: produce value >=0
int dist(int x1, int y1, int x2, int y2) {
const int a = (x1-x2) * (x1-x2);
const int b = (y1-y2) * (y1-y2);
return a + b;
 }



int sum_squares (int n) {
const int a = (n + 1);
const int b = ((2 * n) + 1);
const int c = (n * a * b);
return c / 6;
}   

int gcd(int n,int m){
const int c=(m==0)? n:gcd(m,(n%m));
return c;
}

int collatz(int n){
const int a=(n==1)? 0:((n%2==0)? collatz(n/2):collatz(3*n+1));
return a+1;
}

int max3(int a, int b, int c){
const max=(a>=b)&&(a>=c)? a: ((b>a)&&(b>=c)? b:c);
return max;
}      
