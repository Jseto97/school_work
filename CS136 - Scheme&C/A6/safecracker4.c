#include"safe4.h"
#include <stdio.h>
#include <stdbool.h>


void get_money(void){
    create_safe();
    int code = get_max_code();
    int base = 0;
    int attempt = code;
    int answer = unlock(attempt);
    while (answer != 0){
        if (answer == -1){
            base = attempt;
            attempt = (code+base)/2;
            answer = unlock(attempt);
        } else if (answer == 1){
            attempt = (attempt+base)/2;
            answer = unlock(attempt);
        } else if (answer == -2){
            printf("The number of attempts so far is greater than the max code.\n");
        }
    }
    printf("%d\n", count_money());
}

/* The run time for this function is log(n), where n is the value of the input max code.
Step 1: O(1), as the functions all have run time O(1);
Step 2: n/2, as it is running binary search;
step 3: O(n) = O(1) + T(n/2);
step 4: O(n) = O(logn); the base of log is 2 */
