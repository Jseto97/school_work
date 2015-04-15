#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "my_memory_manager.h"

char *char_alloc_and_print(int s, const char *cpy) {
  char *ret = char_alloc(s);
  if (ret == NULL) {
    printf("Failed to find space on character heap!\n");
  } else {
    strcpy(ret, cpy);
    char_printpool();
  }
  return ret;
}

void char_free_and_print(char *c) {
  char_free(c);
  char_printpool();
}

int main(void) {
  char_meminit(32);
  char *str1 = char_alloc_and_print(5,  "hello");
  char *str2 = char_alloc_and_print(5,  "there");
  char *str3 = char_alloc_and_print(17, "__memory_manager_");
  char *str4 = char_alloc_and_print(1,  "!");
  char_free_and_print(str3);
  char *str5 = char_alloc_and_print(16,  "comp sci student");
  char_free_and_print(str1);
  char *str6 = char_alloc_and_print(2,  "hi");
  char *str7 = char_alloc_and_print(4,  "oops");

  // This line is to prevent the compiler from complaining about
  // unused variables.
  str1 = str2 = str3 = str4 = str5 = str6 = str7 = NULL;
  char_memdest();
}
