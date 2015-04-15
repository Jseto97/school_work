// ascii-play.c
// module for working with characters

#include <stdbool.h>

// is_printable(c) returns true if c is a printable character
//   see module 04 notes for the correct range of printable characters
//   PRE:  true
//   POST: returns true or false
bool is_printable(char c){
    return (32<=c<=126);
}


// to_digit(c) will return -1 if c is not a digit, otherwise the 
//    value of the digit
//   PRE:  true
//   POST: returns int -1..9
int to_digit(char c){
    const int value = (48<=c<=57)? (c-'0') : -1;
    return value;
}


// to_char(i) will return the character for digit i
//   PRE:  0 <= i <= 9
//   POST: returns char '0'..'9'
char to_char(int i){
    const char c = i + '0';
    return c;
}


// rot13(c) will return c for non-letters, otherwise the ROT13 of c 
//     letters include upper and lower-case letters
//     see https://en.wikipedia.org/wiki/ROT13 for more info
//   PRE:  true
//   POST: returns char 
char rot13(char c){
    const char out = (c<65||91<=c<=96||c>122) ? c :
                     ((65<=c<=77||109<=c<=122) ? (c+13) : 
                     (c-13));
    return out;
}

// closest_vowel(c) will return the closest vowel to c
//     the vowels are a, e, i, o & u
//     the closest vowel could be in upper or lower case,
//       but the return value will always be in lowercase
//     if there is a tie, choose the "smallest" vowel
//     the character c may or may not be a letter
//   PRE:  0 <= c <= 127
//   POST: returns one of: 'a','e','i','o','u'
char closest_vowel(char c){
    const char output = (c<=99) ? 97 :
                        ((c<=103) ? 101 :
                        ((c<=108) ? 105 :
                        ((c<=114) ? 111 : 117)));
    return output;
}

