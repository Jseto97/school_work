// censor.h

// censor(str,pat): replaces the characters of all occurrences of the
// string pat in the string str with '*'.  If pat is a pattern of
// length 0, nothing is changed in str.  Note that, in order to be replaced,
// the portion of the string must *exactly* match pat.
//
// PRE: both str and pat are not NULL.  pat contains no '*' characters.
//
// POST: str is mutated so that all characters in all occurrences of
// pat are replaced by '*' characters.  For example, if str contained
// the string:
//
// "Peter Piper picked a peck of pickled peppers. A peck of pickled peppers Peter Piper picked. If Peter Piper picked a peck of pickled peppers, where's the peck of pickled peppers Peter Piper picked?"
// 
// then, after we run censor(str,"Peter Piper"), str should contain the string:
//
// "*********** picked a peck of pickled peppers. A peck of pickled peppers *********** picked. If *********** picked a peck of pickled peppers, where's the peck of pickled peppers *********** picked?"
//
// TIME: O(n^2) for worst case, O(n) for best case, where n is the length of the string str
// If there is somewhere starting with the first char of pat in str, it will check the length of pat in str to see if they are
// the same, and if the string part pat is in str, it will come to the starting point and go over the length of str part again.
// Therefore, worst case is that str contains several pat and nothing else, and it will always go over the string twice. The 
// best case is when there is no occurence of the first char in pat in str, and it will only go over the str once.
void censor(char str[], char pat[]);
