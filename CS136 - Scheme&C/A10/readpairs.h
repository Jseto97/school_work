#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>


// This line is here to prevent compiler warnings, since strdup
// is not part of the C standard.
char *strdup(const char* in);


// Struct kv_pair: a pair of strings representing a key
// and value.  This struct is returned by the get_next_pair
// function.
struct kv_pair {
  char *key;
  char *value;
};


// open_file(filename): opens the text file specified
// by the string filename, to allow reading of key
// value pairs.
//
// PRE: filename is not NULL
//
// POST: Returns true if the file opened without errors
// returns false otherwise.  If true is returned, a subsequent
// call must be made to the close_file function.
bool open_file(const char *filename);


// get_next_pair(): returns a kv_pair storing the next key and
// value pair in the currently opened file.  If no pair remains
// (all input read) then this returns a kv_pair with fields
// { NULL, NULL }.
//
// PRE: a file is currently open (from calling open_file)
// 
// POST: Caller must free the memory for the returned strings.
struct kv_pair get_next_pair();


// close_file(): Closes the currently opened file.
//
// PRE: none.
//
// POST: none.
void close_file(void);

