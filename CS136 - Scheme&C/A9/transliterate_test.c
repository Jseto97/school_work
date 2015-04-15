#include "transliterate.h"
#include <stdio.h>
#include <stdlib.h>

int main(void) {
  char str[] = "This is a TEST STRING for the transliterate function.";
  char map[] = "abctifghejklnmopqrzduvwxys";
  char *out = transliterate(str, map);
  printf("str: %s\nmap: [%s]\nout: %s\n", str, map, out);
  free(out);
}
