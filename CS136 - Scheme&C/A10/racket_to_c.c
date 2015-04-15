#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <assert.h>
#include "racket_to_c.h"

int foldr(int (*ff)(int,int), int terminal, struct llnode *inlist) {
     int result = terminal;
     struct llnode *temp = NULL;
     struct llnode *rev = NULL;
     for (temp = inlist; temp != NULL; temp = temp->next) {
        rev = cons(temp->item, rev);
     }
     for (temp = rev; temp != NULL; temp = temp->next) {
        result = (*ff)(temp->item,result);
     }
     free_list(rev);
     return result;
}

struct llnode *filter (bool (*ff)(int), struct llnode *inlist) {
     struct llnode *temp = NULL;
     struct llnode **pre = NULL;
     struct llnode *newlist = NULL;
     struct llnode *p = NULL;
     for (temp = inlist; temp != NULL; temp = temp->next) {
         if((*ff)(temp->item)) {
            if (p==NULL) {
                p = malloc(sizeof(struct llnode));
                if (p == NULL) {
                  printf("FATAL ERROR: out of memory\n");
                  exit(-1);
                }
                p->item = temp->item;
                p->next = NULL;
                newlist = p;
            }
            else {
                pre = &(p->next);
                p = malloc(sizeof(struct llnode));
                if (p == NULL) {
                  printf("FATAL ERROR: out of memory\n");
                  exit(-1);
                }
                p->item = temp->item;
                p->next = NULL;
                *pre = p;
            }
         }
     }
     return newlist;
}

struct llnode *map(int (*mf)(int), struct llnode *inlist) {
     struct llnode *temp = NULL;
     struct llnode *newlist = NULL;
     struct llnode **pre = NULL;
     struct llnode *p = NULL;
     for (temp = inlist; temp != NULL; temp = temp->next) {
           if (p==NULL) {
               p = malloc(sizeof(struct llnode));
               if (p == NULL) {
                      printf("FATAL ERROR: out of memory\n");
                      exit(-1);
               }
               p->item = (*mf)(temp->item);
               p->next = NULL;
               newlist = p;
           }
           else {
               pre = &(p->next);
               p = malloc(sizeof(struct llnode));
               if (p == NULL) {
                 printf("FATAL ERROR: out of memory\n");
                 exit(-1);
               }
               p->item = (*mf)(temp->item);
               p->next = NULL;
               *pre = p;
           }
     }
     return newlist;
}
