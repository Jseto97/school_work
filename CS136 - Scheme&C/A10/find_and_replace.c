#include "readpairs.h"
#include "dictionary.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main (void) {

  // you should just leave this line of code as is
  // read the module 11 "yellow box" on casting if you're curious
  Dictionary my_dictionary = create_Dictionary((CompareFunction) strcmp);

  // Do not change the filename on the next line
  if (open_file("kvpairs.txt")) {

    struct kv_pair pair = get_next_pair();
    while (pair.key != NULL) {
      insert(my_dictionary, pair.key, pair.value);
      pair = get_next_pair();
    }
    close_file();

    // Read input from stdin:
    //  - If the word read is a key in the dictionary, then print the the
    //     associated value
    //  - Otherwise, print the word read from stdin

    // TODO.... :)
    char user_input[4096];
    scanf("%s", user_input) == 1;
    char *value = (char *)lookup(my_dictionary, user_input);
    if (value==0) {
             printf("%s",user_input);
    }
    else {
             printf("%s", value);
    }
    while (scanf("%s", user_input) == 1) {
       printf(" ");
       char *value = (char *)lookup(my_dictionary, user_input);
       if (value==0) {
             printf("%s",user_input);
       }
       else {
             printf("%s", value);
       }
    }
    printf("\n");
  } else {
    printf("ERROR: could not find kvpairs.txt\n");
  }
  destroy_Dictionary(my_dictionary);
  return 0;
}
