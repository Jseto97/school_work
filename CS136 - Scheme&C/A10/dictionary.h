// dictionary.h

typedef struct dictionary *Dictionary;
typedef int (*CompareFunction)(const void *, const void *);

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

// create_Dictionary(cf): allocates and returns a new Dictionary
//   using the cf comparison function for keys.
// PRE:  none.
// POST: Caller must free returned dictionary struct.
// TIME: O(1)
Dictionary create_Dictionary(CompareFunction cf);

void free_tree(struct bstnode *node);

// destroy_Dictionary(dict): Frees the memory allocated for dict,
// This also frees the memory for every key and every value
// PRE:  dict is a valid Dictionary (not NULL)
// POST: dict is no longer valid
// TIME: O(1)
void destroy_Dictionary(Dictionary dict);

void bst_insert(void *k, void *v, CompareFunction comp, struct bstnode **ptr_root);

// insert(dict, k, v): insert the key/value pair k/v into the dictionary.
//   the client should not free k or v after insert
//   and should not modify them after insert
// PRE:  dict, k, and v are valid (not NULL)
//       the key k must not already exist in the dictionary
// POST: it will add the (k,v) pair into the dictionary
// TIME: O(n) where n is the number of bst_nodes in the dictionary
void insert(Dictionary dict, void *k, void *v);

void *bst_lookup(void *k, CompareFunction comp, struct bstnode **ptr_root);

// lookup(dict, k): returns the value associated with key k, if such
//   a value exists.  Otherwise, returns NULL.
// PRE:  dict and k are valid (not NULL)
// POST: returns a value or NULL
// TIME: O(n) where n is the number of bst_nodes in the dictionary
void *lookup(Dictionary dict, void *k);
