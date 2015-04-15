// dynarray.h

#include <stdlib.h>
#include <stdbool.h>


extern const int BUFFER_INIT_SIZE;  // Should be defined as 5 in dynarray.c
extern const int KEY_NOT_FOUND;     // Should be defined as -1 in dynarray.c


// The sorted_dyn_array struct represents a dynamic array that can
// grow when integer keys are inserted into it.  The keys are stored
// in the buffer, sorted in ascending order.  All
// keys stored are unique (i.e., there are no duplicates in
// buffer).  You can assume all the keys are non-negative.
struct sorted_dyn_array {
  int *buffer;
  int length;
  int capacity;
};


// sda_create(): initialize and return a new sorted_dyn_array structure.
// Initially, the buffer of the sorted_dyn_array is set to have size
// equal to BUFFER_INIT_SIZE.
//
// PRE: none
//
// POST: returns a pointer to a sorted_dyn_array structure, allocated
// on the heap.  Caller must free this memory using sda_destroy.
//
// TIME: O(1)
struct sorted_dyn_array *sda_create(void);


// sda_destroy(sda): frees the memory associated with both sda->buffer
// and sda itself.
//
// PRE: sda is not NULL
//
// POST: the memory associated with sda->buffer and sda is freed.
//
// TIME: O(1)
void sda_destroy(struct sorted_dyn_array *sda);


// sda_length(sda): returns the number of keys stored in sda->buffer.
//
// PRE: sda is not NULL
//
// POST: returns a non-negative number
//
// TIME: O(1)
int sda_length(struct sorted_dyn_array * sda);


// sda_capacity(sda): returns the current capacity of sda->buffer.
//
// PRE: sda is not NULL
//
// POST: returns a non-negative number
//
// TIME: O(1)
int sda_capacity(struct sorted_dyn_array *sda);


// sda_find_successor(sda, k): returns the index in sda->buffer of the
// key t that is the the SUCCESSOR of k, if one exists, and
// KEY_NOT_FOUND otherwise. Key t is the SUCCESSOR of k if t
// is the smallest key stored in sda->buffer such that t >= k.
// HINT: You can implement this function (rather easily) using the
// binary search algorithm provided in the lecture notes.  Note that
// the keys stored in sda are all sorted (see documentation of struct
// sorted_dyn_array above).
//
// PRE: sda is not NULL
//
// POST: returns an index pos, such that 0 <= pos < sda->length, OR
// returns KEY_NOT_FOUND.
//
// TIME: O(log n) where n = sda->length
int sda_find_successor(struct sorted_dyn_array *sda, int k);


// sda_insert(sda, k): uses sda_find_successor to the location
// in sda->buffer where key k should be inserted.  If k is already
// present in sda then we are done. Otherwise, insert k in the correct
// position in sda->buffer, shifting all keys with larger values to
// higher array indices. For example, if sda contains the set of keys
// {1,4,5,6}, these keys are stored in sda->buffer in indices
// {0,1,2,3} respectively.  If we insert the key 3, then the new
// sorted set of keys should be {1,3,4,5,6}, which will be stored in
// sda->buffer indices {0,1,2,3,4} respectively.  See the example
// program and the input/output files.
// 
// PRE: sda is not NULL, and k is a non-negative number.
//
// POST: k is inserted into the correct index in sda->buffer.
// If sda->buffer is already full when we insert k, then we
// DOUBLE its size, as in the Module 9 lecture notes.  Returns
// true if k was not already present in sda, and false otherwise.
//
// TIME: O(n) in the worst case, where n = sda->length
bool sda_insert(struct sorted_dyn_array *sda, int k);


// sda_delete(sda, k): uses sda_find_successor to find the
// SUCCESSOR of k.  If the SUCCESSOR key is not equal to k, then
// return false. Otherwise, shift all elements with keys larger than k
// to smaller array indices, erasing the key k, and return true.  For
// example, if sda->buffer contains the set of keys {2,5,7,9} and we
// call sda_delete(sda, 5), then the set of keys should be
// {2,7,9}.
//
// PRE: sda is not NULL, k is a non-negative number.
//
// POST: See description.  The key equal to k is deleted from sda, if
// it exists, and true is returned.  All elements with keys larger
// than k are shifted (i.e., have their array indices decremented).
// If no key is equal to k, return false.
//
// TIME: O(n) in the worst case, where n = sda->length
bool sda_delete(struct sorted_dyn_array *sda, int k);


// sda_get(sda, pos): returns the key in sda->buffer[pos].
//
// PRE: sda is not NULL, 0 <= pos < sda_length(sda).
//
// POST: see description.
//
// TIME: O(1)
int sda_get(struct sorted_dyn_array *sda, int pos);


