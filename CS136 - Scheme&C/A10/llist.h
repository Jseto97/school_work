#include <stdbool.h>

struct llnode {
  int item;
  struct llnode *next;
};

int first(struct llnode *lst);
struct llnode *rest(struct llnode *lst);
struct llnode *empty(void);
bool is_empty(struct llnode *lst);
struct llnode *cons(int f, struct llnode *r);
void free_list(struct llnode *lst);
