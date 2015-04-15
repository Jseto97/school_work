#include "dynarray.h"
#include <assert.h>
#include <stdio.h>

const int BUFFER_INIT_SIZE = 5;
const int KEY_NOT_FOUND = -1;

struct sorted_dyn_array *sda_create(void) {
    struct sorted_dyn_array *new_sda = malloc(sizeof(struct sorted_dyn_array));
    if (new_sda == NULL) {
        printf("Out of memory! \n");
    }
    new_sda->buffer = malloc(sizeof(int)*BUFFER_INIT_SIZE);
    if (new_sda->buffer == NULL) {
        printf("Out of memory! \n");
    }
    new_sda->length = 0;
    new_sda->capacity = BUFFER_INIT_SIZE;
    for (int i=0;i<BUFFER_INIT_SIZE;i++){
        new_sda->buffer[i] = 0;
    }
    return new_sda;
}

void sda_destroy(struct sorted_dyn_array *sda) {
       free(sda->buffer);
       free(sda);
}

int sda_length(struct sorted_dyn_array * sda) {
    return sda->length;
}

int sda_capacity(struct sorted_dyn_array *sda) {
      return sda->capacity;
}

int sda_find_successor(struct sorted_dyn_array *sda, int k) {
       if (sda_length(sda)>0) {
		   int imin = 0;
		   int imax = 0;
		   imax = sda_length(sda);
		   int imid = 0;
		   if (sda->buffer[imax-1]<k){
              return KEY_NOT_FOUND;
              }
           else {
		   while(imax >= imin) {
			   imid = (imin +imax)/2;
			   if (sda->buffer[imid] < k)
				   imin = imid + 1;
			   else if (sda->buffer[imid] > k)
				   imax = imid - 1;
			   else
				   return imid;
		   }
		   if ((imin == imid + 1) && (imid+1<sda_length(sda)))
				   return imid + 1;
		   else if ((imax == imid - 1) && (imid < sda_length(sda)))
				   return imid;
		   else
				   return KEY_NOT_FOUND;
	   }
       }
	   else {
	       return KEY_NOT_FOUND;
       }
}

bool sda_insert(struct sorted_dyn_array *sda, int k) {
    assert(k>=0);
    if (sda_capacity(sda) == sda_length(sda)) {
           sda->capacity = sda_capacity(sda)*2;
           sda->buffer = realloc(sda->buffer, sizeof(int)*sda_capacity(sda));
           for (int i=sda_length(sda);i<sda_capacity(sda);i++)
                  sda->buffer[i] = 0;
       }
       int pos = 0;
       pos = sda_find_successor(sda,k);
       if (pos != KEY_NOT_FOUND) {
          if (sda->buffer[pos]==k)
                         return false;
          for (int i=sda_length(sda)-1; i>=pos; i--)
               sda->buffer[i+1] = sda->buffer[i];
          sda->buffer[pos] = k;
          sda->length = sda_length(sda)+1;
          return true;
       }
       else {
          sda->buffer[sda_length(sda)] = k;
          sda->length = sda_length(sda)+1;
          return true;
       }
}

bool sda_delete(struct sorted_dyn_array *sda, int k) {
    assert(k>=0);
       int pos = 0;
       pos = sda_find_successor(sda,k);
          if (pos == KEY_NOT_FOUND)
            return false;
          else if (sda->buffer[pos]!=k){
            return false;
          }
          for (int i=pos+1; i<sda_length(sda); i++)
               sda->buffer[i-1] = sda->buffer[i];
          sda->length = sda_length(sda)-1;
          return true;
}

int sda_get(struct sorted_dyn_array *sda, int pos) {
    assert(pos >=0 && pos <sda_length(sda));
    return sda->buffer[pos];
}
