#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

struct node {
   int item;
   struct node *next;
};

struct node *rest(struct node *lst) {
   assert (lst != NULL);
   return lst->next;
};

char *trimwhitespace(char *str)
{
  char *end;
  while((*str)==' ') str++;
  if((*str) == 0)
    return str;

  end = str + strlen(str) - 2;
  while(end > str && (*end)==' ') end--;
  *(end+1) = '\n';
  *(end+2) = 0;
  return str;
}

void reverse_polish_notation(const char * str) {
    struct node *rpn_stack = NULL;
    int i,j;
    char result[10];
    int strend = 0;
    if (str != NULL) {
    for(i=0;str[i]!='\0';) {
        j = 0;
        while (str[i]!=' ') {
            if (str[i]>='0' && str[i]<='9') {
                result[j++] = str[i++];
            }
            else if (str[i] == '\n') {
                strend = 1;
                break;
            }
            else if (str[i] == '+' || str[i] == '-' || str[i] == '*' || str[i] == '/'){
                result[0] = str[i++];
            }
            else {
                printf("error\n");
                while(rpn_stack != NULL) {
                  struct node *backup = rest(rpn_stack);
                  free(rpn_stack);
                  rpn_stack = backup;
                }
                return ;
            }
        }
        if (j != 0)
            result[j] = '\0';
        if (result[0] == '+') {
            if (rpn_stack == NULL || rpn_stack->next == NULL) {
                printf("error\n");
                while(rpn_stack != NULL) {
                  struct node *backup = rest(rpn_stack);
                  free(rpn_stack);
                  rpn_stack = backup;
                }
                return ;
            }
            else {
                int t = rpn_stack->next->item + rpn_stack->item;
                if ((rpn_stack->next->item > 0 && rpn_stack->item > 0 && t < 0) ||
                    (rpn_stack->next->item < 0 && rpn_stack->item < 0 && t > 0)) {
                    printf("error\n");   // overflow or underflow
                    while(rpn_stack != NULL) {
                          struct node *backup = rest(rpn_stack);
                          free(rpn_stack);
                          rpn_stack = backup;
                    }
                    return ;
                }
                rpn_stack->next->item = t;
                struct node *p = rpn_stack;
                rpn_stack = p->next;
                free(p);
            }
        }
        else if (result[0] == '-') {
            if (rpn_stack == NULL || rpn_stack->next == NULL) {
                printf("error\n");
                while(rpn_stack != NULL) {
                      struct node *backup = rest(rpn_stack);
                      free(rpn_stack);
                      rpn_stack = backup;
                }
                return ;
            }
            else {
                rpn_stack->next->item -= rpn_stack->item;
                struct node *p = rpn_stack;
                rpn_stack = p->next;
                free(p);
            }
        }
        else if (result[0] == '*') {
            if (rpn_stack == NULL || rpn_stack->next == NULL) {
                printf("error\n");
                while(rpn_stack != NULL) {
                      struct node *backup = rest(rpn_stack);
                      free(rpn_stack);
                      rpn_stack = backup;
                }
                return ;
            }
            else {
                int t = rpn_stack->next->item * rpn_stack->item;
                if (rpn_stack->item != 0 && ((float)t) / rpn_stack->item != (float)rpn_stack->next->item) {
                    printf("error\n");   // overflow or underflow
                    while(rpn_stack != NULL) {
                      struct node *backup = rest(rpn_stack);
                      free(rpn_stack);
                      rpn_stack = backup;
                    }
                    return ;
                }
                rpn_stack->next->item = t;
                struct node *p = rpn_stack;
                rpn_stack = p->next;
                free(p);
            }
        }
        else if (result[0] == '/') {
            if (rpn_stack == NULL || rpn_stack->item == 0 || rpn_stack->next == NULL) {
                printf("error\n");
                while(rpn_stack != NULL) {
                      struct node *backup = rest(rpn_stack);
                      free(rpn_stack);
                      rpn_stack = backup;
                }
                return ;
            }
            else {
                rpn_stack->next->item /= rpn_stack->item;
                struct node *p = rpn_stack;
                rpn_stack = p->next;
                free(p);
            }
        }
        else {
            struct node *new_node = malloc(sizeof(struct node));
            if ((strcmp(result,"2147483647")>0 && strlen(result)==10) || strlen(result)>10) {
               printf("error\n");   //overflow
               free(new_node);
               while(rpn_stack != NULL) {
                  struct node *backup = rest(rpn_stack);
                  free(rpn_stack);
                  rpn_stack = backup;
               }
               return ;
            }
            new_node->item = atoi(result);
            new_node->next = rpn_stack;
            rpn_stack = new_node;
            result[0] = '\0';
        }
        if (strend != 1)
            i++;
        else break;
       }
       if(rpn_stack->next != NULL) {
        printf("error\n");
        while(rpn_stack != NULL) {
              struct node *backup = rest(rpn_stack);
              free(rpn_stack);
              rpn_stack = backup;
        }
        return ;
       }
       int num = rpn_stack->item;
       while(rpn_stack != NULL) {
          struct node *backup = rest(rpn_stack);
          free(rpn_stack);
          rpn_stack = backup;
       }
       printf("%d\n",num);
       return ;
    }
    else {
       printf("String is empty.\n");
       return ;
    }
}

int main(void) {
       char p;
       int i;
       char *string1 = malloc(sizeof(char)*4096);
       while(1){
         i = 0;
         do{
               p=getchar();
               if (p == EOF)
                  return 0;
               string1[i++] = p;
         }while(p != '\n');
         string1 = trimwhitespace(string1);
         reverse_polish_notation(string1);
       }
       free(string1);
       return 0;
}
