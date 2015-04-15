#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>
#include "llist.h"

// see the class notes for more information

struct llnode *empty(void) {
  return NULL;
}

bool is_empty(struct llnode *lst) {
  return lst == empty();
}

int first(struct llnode *lst) {
  assert (lst != empty());
  return lst->item;
}


struct llnode *rest(struct llnode *lst) {
  assert (lst != empty());
  return lst->next;
}

struct llnode *cons(int f, struct llnode *r) {
  struct llnode *new = malloc(sizeof(struct llnode));
  if (new == NULL) {
    printf("FATAL ERROR: cons ran out of memory\n");
    exit(EXIT_FAILURE);
  }
  new->item = f;
  new->next = r;
  return new;
}


void free_list(struct llnode *lst) {
  if (lst != NULL) {
    free_list(rest(lst));
    free(lst);
  }
}
