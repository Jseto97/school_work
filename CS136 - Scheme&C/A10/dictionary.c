// dictionary.c

#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include "dictionary.h"

struct bstnode {
  void *key;
  void *value;
  struct bstnode *left;
  struct bstnode *right;
};

struct dictionary {
  struct bstnode *root;
  CompareFunction comp;
};

Dictionary create_Dictionary(CompareFunction cf) {
   Dictionary dict = malloc(sizeof(struct dictionary));
   dict->root = 0;
   dict->comp = cf;
   return dict;
}

void free_tree(struct bstnode *node) {
    if (node == 0) return ;
    else {
         free_tree(node->left);
         free_tree(node->right);
         free(node->key);
         free(node->value);
         free(node);
    }
}

void destroy_Dictionary(Dictionary dict) {
    free_tree(dict->root);
    free(dict);
}

void bst_insert(void *k, void *v, CompareFunction comp, struct bstnode **ptr_root) {
    struct bstnode *t = *ptr_root;
    if (t == 0) {
       *ptr_root = malloc(sizeof(struct bstnode));
       (*ptr_root)->key = k;
       (*ptr_root)->value = v;
       (*ptr_root)->left = 0;
       (*ptr_root)->right = 0;
    } else if ((*comp)(k, t->key)==0) {
        return;
    } else if ((*comp)(k, t->key)<0) {
        bst_insert(k,v,comp,&(t->left));
    } else
        bst_insert(k,v,comp,&(t->right));
}

void insert(Dictionary dict, void *k, void *v) {
    bst_insert(k,v,dict->comp,&(dict->root));
}

void *bst_lookup(void *k, CompareFunction comp, struct bstnode **ptr_root) {
    struct bstnode *t = *ptr_root;
    if (t == NULL) {
      return NULL;
    } else if ((*comp)(k, t->key)==0) {
        return t->value;
    } else if ((*comp)(k, t->key)<0) {
        return bst_lookup(k,comp,&(t->left));
    } else
        return bst_lookup(k,comp,&(t->right));
}

void *lookup(Dictionary dict, void *k) {
    return bst_lookup(k,dict->comp,&(dict->root));
}
