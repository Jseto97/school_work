// strqueue.c
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "strqueue.h"


// this is just a file to get you started
// you don't have to use it, but it's recommended.

// strnode is a like the linked list node defined in llist.h
// except it stores a string instead of an int.
struct strnode {
   char *item;
   struct strnode *next;
};


// The strqueue structure for representing a queue ADT,
// represented using a linked list.  Stores a pointer to both
// the front of the list, as well as the back (last element
// in the list).  Also maintains the length of the queue.
struct strqueue {
   struct strnode *front;
   struct strnode *back;
   int length;
};

StrQueue create_StrQueue(void) {
  StrQueue new_sq = malloc(sizeof(struct strqueue));
  if (new_sq == NULL) {
    printf("FATAL ERROR: out of memory\n");
    exit(-1);
  }
  new_sq->front = NULL;
  new_sq->back = NULL;
  new_sq->length = 0;
  return new_sq;
}

void destroy_StrQueue(StrQueue sq) {
  char *p = pop_front(sq);
  while (p != NULL) {
    free(p);
    p = pop_front(sq);
  }
  free(sq);
}

void push_back(StrQueue sq, const char *str) {
  struct strnode *new_node = malloc(sizeof(struct strnode));
  new_node->item = malloc(sizeof(char)*(strlen(str)+1));
  strcpy(new_node->item, str);
  new_node->next = NULL;
  if (sq->length == 0) {
    sq->front = new_node;
    sq->back = new_node;
  }
  else if (sq->length == 1) {
    sq->back->next = NULL;
    sq->back = new_node;
    sq->front->next = new_node;
  }
  else {
    sq->back->next = new_node;
    sq->back = new_node;
  }
  sq->length += 1;
}

char *pop_front(StrQueue sq) {
  if (get_length(sq) == 0) {
    return NULL;
  }
  else {
    char *str = malloc(sizeof(char)*(strlen(sq->front->item)+1));
    strcpy(str, sq->front->item);
    struct strnode *p = sq->front;
    sq->front = sq->front->next;
    free(p->item);
    free(p);
    sq->length -= 1;
    return str;
  }
}

char *peek_front(StrQueue sq) {
  if (get_length(sq) == 0) {
    return NULL;
  } else {
    return sq->front->item;
  }
}

int  get_length(StrQueue sq) {
   return sq->length;
}

