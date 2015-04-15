// create_safe() sets up a safe
//   PRE:  no safe has been already created
//   POST: reads in a non-negative integer max_code from standard input and
//         locks the safe with a code in 0..max_code
//	   max_code is in 0..INT_MAX/2
//   TIME: O(1)
void create_safe(void);

// get_max_code() returns the maximum possible value of the safe code
//   PRE:  safe has already been created
//   POST: returns a non-negative integer
//   TIME: O(1)
int get_max_code(void);

// unlock(code) attempts to unlock the safe with code
//   PRE:  safe has already been created, max_code >= code >= 0
//   POST: if the safe is already unlocked, returns 0
//         otherwise, if the code is correct, unlocks the safe (except see below)
//         returns  0, if the safe was unlocked
//         returns -1, if the code is smaller than the safe code
//         returns  1, if the code is larger than the safe code
//         returns -2, if the number of attempts so far is greater than O(log max_code)
//                     (the safe remains locked in this case, and a warning message is printed out)
//   TIME: O(1)
int unlock(int code);

// count_money() returns -1 if the safe is locked, and
//               the amount of money in the safe otherwise
//   PRE:  true
//   POST: returns int -1..INT_MAX
//   TIME: O(1)
int count_money(void);
