#include <stdio.h>
#include "dynarray.h"

int main(void) {

  struct sorted_dyn_array *myarray = sda_create();

  int next = 0;
  while (scanf("%d",&next) == 1) {
    int next_item = next;
    sda_insert(myarray, next_item);
  }

  printf("===== myarray final contents =====\n");
  while (sda_length(myarray) > 0) {
    int first = sda_get(myarray, 0);
    printf("%d\n", first);
    sda_delete(myarray, first);
  }
  printf("======== End of contents =========\n");

  sda_destroy(myarray);
}
