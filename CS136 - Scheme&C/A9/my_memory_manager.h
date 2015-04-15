// charalloc.h


// char_meminit(s): initializes the character heap.  Returns a 0 if we
// failed to initialize our character heap, and 1 if we succeed.
//
// PRE: s is a positive number
//
// POST: the global variable charheap is initialized to point to an
// array of s chars.  The array should be initialized so that every
// entry stores the '\0' character.  User must free the charheap
// eventually using the char_memdest function.
//
// TIME: O(n), where n is the value of s
int char_meminit(int s);


// char_memdest: frees the global array charheap, returning the memory
// to the heap.
//
// PRE: none
//
// POST: If charheap != NULL, then frees the array charheap, and sets
// charheap to NULL;
//
// TIME: O(1)
void char_memdest();


// char_print(): prints the charheap to stdout.  Each '\0' character
// is printed as a '\\' (backslash), all other characters are printed
// as they appear in charheap.  A newline is printed after the last
// character in the array.  See example output.
//
// PRE: char_meminit has been called before.
//
// POST: correctly formatted output printed to stdout (see description
// above).
void char_printpool();


// char_alloc(s): find the FIRST contiguous block of s+1 NULL ('\0')
// characters in charheap that does not contain the NULL terminator
// of some previously allocated string.  See the example output for
// further clarification.
//
// PRE: char_meminit has been called already.  s is a positive number.
//
// POST: If a contiguous block of free memory exists on the charheap
// of size s+1, then return a pointer to the start of that
// block. Otherwise, return NULL.
//
// TIME: O(n), where n is the size of charheap
char *char_alloc(int s);


// char_free(p): given a string p, char_free returns the memory
// occupied by the string to the charheap for later use.  This is
// accomplished by resetting all characters in the string to '\0'.
// See example output for further clarification.
//
// PRE: p points to an array location within charheap.
//
// POST: All characters in the string p (up to the '\0' terminator) are
// reset to '\0'.
//
// TIME: O(n), where n is the length of p
void char_free(char *p);
