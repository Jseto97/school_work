// tokenize.h 

// tokenize_init(str): Initialize the tokenizer buffer by copying 
// the input string into it.  The tokenizer buffer is a global string
// that can store up to 1024 characters.
//
// PRE: str is not NULL, and strlen(str) < 1024.
// 
// POST: tokenize_next can be called.
//
// TIME: O(1)
void tokenize_init(const char str[]);


// tokenize_next: returns a pointer to the next word in the tokenizer
//                buffer. A word is defined as a set of consecutive 
//                alphabetic characters (characters in the ranges A-Z or 
//                a-z). All whitespace, punctuation, numeric characters 
//                act as delimiters that break up words, and will not be
//                a part of words themselves.
//
// PRE: tokenizer_init must have been called at least once before
//      calling this function.
//
// POST: Changes the next "word" in the tokenizer buffer into a 
//       NULL terminated string, and returns a pointer to that 
//       "word".  If there are no more words left in the tokenizer 
//       buffer we return NULL.
//
// TIME: O(n)
// The best case is O(1) when there are no more words left in the tokenizer. 
// The worst case is O(n) when there is a word left in the tokenizer. n is
// the length of the word.
char *tokenize_next();
