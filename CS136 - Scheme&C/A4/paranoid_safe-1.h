#include <stdbool.h>

// unlock(code) attempts to unlock the safe with code
//   PRE:  1 <= code <= 1000
//   POST: if the safe is already unlocked, returns true
//         otherwise, if the code is correct AND the overall number of attempts <=3:
//         unlocks the safe and sets the global variable unlocked to true 
//         returns true, if the safe was unlocked, and false otherwise
bool unlock(int code);

// count_money(void) returns -1 if the safe is still locked, and
//                            the amount of money in the safe otherwise
//   PRE: true
//   POST: returns int -1..INT_MAX
int count_money(void);
