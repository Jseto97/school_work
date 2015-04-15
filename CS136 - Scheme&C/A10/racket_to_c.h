// racket_to_c.h

#include "llist.h"

// foldr(ff,terminal,inlist): Should return the equivalent of
//   (foldr ff terminal inlist) in racket; only works with functions
//   ff that take in two numbers and return one number.
//  
// PRE: none
//
// POST: see description
//
// TIME: O(n) where n is the length of inlist (assuming ff takes O(1) time).
int foldr(int (*ff)(int,int), int terminal, struct llnode *inlist);

// filter(ff,inlist): Should return a new list equivalent to the
// calling the racket function (filter ff inlist).
//  
// PRE: none
//
// POST: caller must free returned list using free_list (provided in llist.h).
//
// TIME: O(n) where n is the length of inlist (assuming ff takes O(1) time).
struct llnode *filter (bool (*ff)(int), struct llnode *inlist);

// map(mf,inlist): Should return a new list equivalent to the
// calling the racket function (map mf inlist).
//  
// PRE: none
//
// POST: caller must free returned list using free_list (provided in llist.h).
//
// TIME: O(n) where n is the length of inlist (assuming mf takes O(1) time).
struct llnode *map(int (*mf)(int), struct llnode *inlist);
