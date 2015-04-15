// strqueue.h
#include <stdbool.h>

struct strqueue;
typedef struct strqueue *StrQueue;

// create_StrQueue(): creates a new StrQueue
// PRE:  none.
// POST: caller must call destroy_StrQueue
// TIME: O(1)
StrQueue create_StrQueue(void);


// destroy_StrQueue(sq): frees the memory occupied by StrQueue
//   and frees every node, including every string
// PRE:  sq is a valid StrQueue (not NULL)
// POST: none.
// TIME: O(n), where n is length of sq
void destroy_StrQueue(StrQueue sq);


// push_back(sq, str): makes a copy of str and places it at the
//   end of the queue
// PRE:  sq is a valid StrQueue (not NULL)
//       str is not NULL.
// POST: sq length increased by 1
//       str is now at the end of sq
// TIME: O(m) where m is the length of str
void push_back(StrQueue sq, const char *str);


// pop_front(sq): frees the node at the front of the sq 
//   and returns the string that was first in the queue
//   NOTE: caller's responsibility to free the returned string
// PRE:  sq is a valid StrQueue (not NULL)
// POST: if sq is empty, returns NULL 
//       otherwise, returns the first string (caller must free)
//         sq length decreased by 1
// TIME: O(1)
char *pop_front(StrQueue sq);


// peek_front(queue): returns a the first item stored in sq
// PRE:  sq is a valid StrQueue (not NULL)
// POST: if sq is empty, returns NULL
//       otherwise, returns the first string (do NOT free this)
// TIME: O(1)
char *peek_front(StrQueue sq);


// get_length(sq): returns the number of items in the queue.
// PRE:  sq is a valid StrQueue (not NULL)
// POST: returns int >= 0
// TIME: O(1)
int  get_length(StrQueue sq);
