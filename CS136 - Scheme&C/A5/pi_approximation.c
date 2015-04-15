// pi_approximation.c

#include "pi_approximation.h"

static int gcd(int a, int b) {
    return (b == 0) ? a : gcd(b, a % b);
}

static struct rational make_rational(int a, int b) {
    struct rational r = { a, b };
    return r;
}

struct rational approximate_pi(int x) {
    int n = 0;
    int a = 4;
    int b = 1;
    int g = 1;
    int i = 1;

    // print the stack frame here 
    
    for (int l=0; l<20; l++){
        printf ("*");
    }
    
    while (n < x) {
        n = n + 1;
    	i = n;
    	a = i * i;
    	b = 2*i + 1;

    	while (i > 1) {	
    	    i = i - 1;
    	    b = (2*i + 1) * b + a;
    	    a = i * i * ((b - a)/(2*i + 1));
    	}

    	b = a+b;
    	a = 4*(b-a);

    	g = gcd(a,b);
    	a /= g;
    	b /= g;

        // print the stack frame here 
    printf("\n");
    printf("* a:%14d *\n", a);
    printf("* b:%14d *\n", b);
    printf("* g:%14d *\n", g); 
    printf("* i:%14d *\n", i); 
    printf("* n:%14d *\n", n);
    printf("* x:%14d *\n", x);
        
        
    for (int l=0; l<20; l++){
        printf ("*");
    } 
    printf("\n");
    }

    return make_rational(a, b);
}

