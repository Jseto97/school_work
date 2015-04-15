#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>

struct llnode {
  char item;
  struct llnode *next;
};

struct llnode *rest(struct llnode *lst) {
  assert (lst != NULL);
  return lst->next;
}

void free_list(struct llnode *lst) {
  if (lst != NULL) {
    free_list(rest(lst));
    free(lst);
  }
}

void add_to_front(char n, struct llnode **ptr_front) {
  struct llnode *new_ptr = malloc(sizeof(struct llnode));
  if (new_ptr == NULL) {
        printf("FATAL ERROR: out of memory\n");
        exit(-1);
  }
  new_ptr->item = n;
  new_ptr->next = *ptr_front;
  *ptr_front = new_ptr;
}

char remove_from_front(struct llnode **ptr_front) {
  struct llnode *frontp = * ptr_front;
  char retval = frontp->item;
  *ptr_front = frontp->next;
  free(frontp);
  return retval;
}

bool balanced(const char str[]) {
   char p = str[0];
   struct llnode *ptr = NULL;
   int i = 0;
   while (p != '\0') {
      if (p == '(' || p == '[' || p == '{') {
        add_to_front(p, &ptr);
      }
      else if (p == ')') {
        if (ptr->item != '(') {
            free_list(ptr);
            return false;
        }
        else {
            remove_from_front(&ptr);
        }
      }
      else if (p == ']') {
        if (ptr->item != '[') {
            free_list(ptr);
            return false;
        }
        else {
            remove_from_front(&ptr);
        }
      }
      else if (p == '}') {
        if (ptr->item != '{') {
            free_list(ptr);
            return false;
        }
        else {
            remove_from_front(&ptr);
        }
      }
      i++;
      p = str[i];
   }
   free_list(ptr);
   return true;
}

