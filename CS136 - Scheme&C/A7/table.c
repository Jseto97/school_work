// table.c
#include<stdio.h>
#include"table.h"
 
struct dimension;

struct rectangle;

int table_get_size(const struct dimension *dim){
    return (dim->num_row * dim->num_col);
}

void table_set_entry(int t[], 
		     const struct dimension *dim,
		     const int row, 
		     const int col, 
		     const int v){
		     const int index = dim->num_col*row + col;
		     t[index] = v;
}

int table_get_entry(const int t[], 
		    const struct dimension *dim,
		    const int row, 
		    const int col){
		    const int index = dim->num_col*row + col;
		    return t[index];
		    }

void table_clear(int t[], const struct dimension *dim){
    for (int i = 0; i < dim->num_row; i++){
        for (int j=0; j < dim->num_col; j++){
            t[i*dim->num_col+j] = 0;
        }
    }
}

void table_copy(const int a[], int b[], const struct dimension *dim){
   for (int i = 0; i < dim->num_row; i++){
        for (int j=0; j < dim->num_col; j++){
            int index = i * dim->num_col + j;
            b[index] = a[index];
        }
    }
}

void print_bit_pattern(const int t[], 
		       const struct dimension *dim, 
		       const struct rectangle *win){
	 // print the upper bound of the table
	 printf("+");
    for (int n=0; n < win->size.num_row; n++){
        printf("-");
    }
    printf("+\n");
    for (int i=0; i< win->size.num_col; i++){
        // print the left bound of the table
        printf("|");
        for (int j=0; j < win->size.num_col; j++){
            int index = (i + win->start_row) * dim->num_col + (j + win->start_col);
            if (t[index] == 0) {
                printf(" ");
            } else {
                printf("X");
            }
        }
        printf("|\n");
    }
    printf("+");
    for (int n=0; n < win->size.num_row; n++){
        printf("-");
    }
    printf("+\n");
}

void read_bit_pattern(int t[], 
		      const struct dimension *table_dim,
		      const int start_row,
		      const int start_col,
		      struct dimension *input_dim){
    int index = -1;
    if (input_dim->num_col+start_col <= table_dim->num_col &&
        input_dim->num_row+start_row <= table_dim->num_row){
        for (int i = start_row; i < (start_row + input_dim->num_row); i++){
            for (int j = start_col; j < (start_col + input_dim->num_col); j++){
                int n = 0;
                scanf("%d\n", &n);
                index++;
                if (((index%input_dim->num_col==0)&&n==EOF)||n!=EOF){
                    if (n==0){
                    table_set_entry(t, table_dim, i, j, " ");
                    } else{
                    table_set_entry(t, table_dim, i, j, "X");
                    }
                } else {
                printf("invalid input. The program is closing...");
                }
            }
        }
     } else {
         printf("invalid input. The program is closing...");
     }
}
 
