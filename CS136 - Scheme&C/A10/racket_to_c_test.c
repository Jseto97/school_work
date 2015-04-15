#include "racket_to_c.h"
#include <stdio.h>
#include <stdlib.h>


// Some functions to play around with
bool is_odd(int i)          { return i % 2 == 1; }
bool is_even(int i)         { return i % 2 == 0; }
int  add_one(int i)         { return i+1;        }
int  subtract(int a, int b) { return a - b;      }

// Takes in a list and prints it out racket style
void printlist(struct llnode *mylist) {
   printf("'(");
   for (struct llnode *p = mylist; p != NULL; p = p->next) {
      printf("%d", p->item);
      if (p->next != NULL) {
         printf(" ");
      }
   }
   printf(")\n");
}


int main(void) {

   struct llnode *mylist = NULL;

   // Create a list of the integers from 1 to 10
   for (int i = 10; i >= 1; i--) {
      mylist = cons(i, mylist);
   }

   printlist(mylist);

   // Filter out the odd list elements
   struct llnode *oddguys = filter(is_odd, mylist);
   printlist(oddguys);

   // Filter out the even list elements
   struct llnode *evenguys = filter(is_even, mylist);
   printlist(evenguys);

   struct llnode *evenguysplusone = map(add_one, evenguys);
   struct llnode *evenguysplustwo = map(add_one, evenguysplusone);
   printlist(evenguysplustwo);

   int result = foldr(subtract, 0, evenguys);
   printf("foldr on \"evenguys\" : %d\n",result);

   free_list(mylist);
   free_list(oddguys);
   free_list(evenguys);
   free_list(evenguysplusone);
   free_list(evenguysplustwo);
}
