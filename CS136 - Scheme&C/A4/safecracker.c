#include <stdbool.h>

// unlock(code) attempts to unlock the safe with code
//   PRE:  1 <= code <= 100
//   POST: if the safe is already unlocked, returns true
//         otherwise, if the code is correct, unlocks the safe
//         returns true, if the safe was unlocked, and false otherwise
bool check_unlock(int code){
    const bool out =(unlock(code)==1) ? 1 : check_unlock(code+1)

// count_money(void) returns -1 if the safe is locked, and
//                           the amount of money in the safe otherwise
//   PRE: true
//   POST: returns int -1..INT_MAX
int count_money(void);

void get_money(void){
    unlock(code);
    const int d = count_money();
    printf("%d", d);
}
