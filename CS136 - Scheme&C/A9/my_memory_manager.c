#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include "my_memory_manager.h"

// Pointer to our heap of characters
char *charheap;

// Size of the heap
int charheap_size;

// DO NOT MODIFY THE FOLLOWING FUNCTION
int char_meminit(int s) {
  assert(s > 0);

  charheap = malloc(sizeof(char) * s);
  if (charheap == NULL) {
    charheap_size = 0;
    return 0;
  }
  charheap_size = s;
  int i;
  for (i = 0; i < charheap_size; i++) {
    charheap[i] = '\0';
  }
  return 1;
}


// DO NOT MODIFY THE FOLLOWING FUNCTION
void char_memdest() {
  if (charheap != NULL) {
    free(charheap);
    charheap = NULL;
    charheap_size = 0;
  }
}


// DO NOT MODIFY THE FOLLOWING FUNCTION
void char_printpool() {
  int i;
  for (i = 0; i < charheap_size; i++) {
    if (charheap[i] == '\0') {
      printf("\\");
    } else {
      printf("%c",charheap[i]);
    }
  }
  printf("\n");
}

char *char_alloc(int s) {
  int i = 0;
  int cnt = 0;
  bool pre = false;
  while(i<charheap_size) {
    if (charheap[i]=='\0'){
      if (pre!=true) {
            cnt = 1;
            pre = true;
      }
      else
            cnt++;
      if (cnt == s+1) {
        if(i==s)
            return charheap;
        else if(i<charheap_size-1 && charheap[i+1]=='\0')
            return charheap+i-s+1;
      }
    }
    else
      pre = false;
    i++;
  }
  return NULL;
}


void char_free(char *p) {
   if (p!=NULL) {
       while(*p!='\0') {
         *p='\0';
         p++;
       }
   }
}


