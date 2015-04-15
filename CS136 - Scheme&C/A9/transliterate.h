#include <stdbool.h>
#include <string.h>

// is_map(map): returns true if map is a VALID transliteration map.  A
// transliteration map is valid if it is a NULL terminated string in which 
// all characters are lower case, and each character--- 'a' to 'z'---
// appears exactly once. For example: "abcdefghijklmnopqrstuvwxyz" and
// "zyxwvutsrqponmlkjihgfedcba" are both VALID transliteration maps, whereas
// "aaaaaaaaaaaaaaaaaaaaaaaaaa" is not.  Note that the English alphabet
// contains 26 characters.
//
// PRE: map is not NULL.
//
// POST: Returns true if map is a valid transliteration map, false
//       otherwise.
//
// TIME: O(27) =  O(1): map is a string of 26 characters followed by a NULL
// terminator.
bool is_map(const char map[27]);


// transliterate(str, map): given a string str and a transliteration
// map, dynamically allocate a new string on the heap that stores the
// transliterated version of str according to map.  The transliteration
// should map all of the characters in str (both upper and lower case) 
// to their new values according to map.  For example, if str =
// "cBaaCC" and map = "zyxwvutsrqponmlkjihgfedcba", then the
// transliterated string that is returned should be "xYzzXX".  Note
// that non-alphabetic characters appear in the transliterated string
// as they appear in the original string str.
//
// PRE: str is not NULL, map is not NULL, map is a VALID transliteration
//      map.
// 
// POST: caller must free returned string.
//       returns NULL if there is not enough memory.
// 
// TIME: O(n) where n = strlen(str) + 1
char *transliterate(const char *str, const char map[27]);
