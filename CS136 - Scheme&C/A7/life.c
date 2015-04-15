//file: life.c

#include <stdio.h>
#include "table.h"


int num_al(gametable, gdim, row, col) { //checks for the number of alive friends the poor cell has
   //note: row, col will always be 1 or more (no need to check for 0)
   int ans = 0;
   int t1 = table_get_entry(&gametable,&gdim,row-1,col-1);
   int t2 = table_get_entry(&gametable,&gdim,row-1,col);
   int t3 = table_get_entry(&gametable,&gdim,row-1,col+1);
   int t4 = table_get_entry(&gametable,&gdim,row,col-1);
   int t5 = table_get_entry(&gametable,&gdim,row,col-1);
   int t6 = table_get_entry(&gametable,&gdim,row+1,col-1);
   int t7 = table_get_entry(&gametable,&gdim,row+1,col);
   int t8 = table_get_entry(&gametable,&gdim,row+1,col+1);
   ans = t1 + t2 + t3 + t4 + t5 + t6 + t7 + t8;
   return ans;
}

int main(void) {
  
   int tablerow = 100;
   int tablecol = 100;
   int gametable[tablerow*tablecol]; // here's our table
   struct dimension gdim = {tablerow,tablecol};
   
   int future[tablerow*tablecol]; // future table to store evoled pieces
   
   int iter_max;
   scanf("%d",&iter_max); //obtains how many round to play
   
   
   
   struct dimension input_dim = {0,0}; //stores info about our input pattern
   read_bit_pattern (gametable, gdim, 50, 50, input_dim);
   
   struct dimension window_size = {40,40};

   struct rectangle window = { //the window to print out
      30 + input_dim.num_row / 2,
      30 + input_dim.num_col / 2,
      window_size
   };
   
   print_bit_pattern (gametable, gdim, window_size); //initial state
   printf("0\n"); //no evolutions yet
   
   //Let the evolution begin!!!
   
   for (int gen = 1; gen <= iter_max; gen ++) { //evolution cycles iter_max times
      int nowrow; //the row we are on now
      int nowcol; // the column we are on now
      
      //now we start from (0,0), checking for changes in state.
      for(nowrow = 1; nowrow != tablerow; nowrow ++) {
         for(nowcol = 1; nowcol != tablecol; nowcol ++) {
            // we are now split into 2 cases, either the current cell is dead or alive
            if (table_get_entry(gametable,gdim,nowrow,nowcol) == 0) {
               //the cell is DEAD
               if (num_al(gametable,gdim,nowrow,nowcol) == 3) {
               // has three living neighbours
                  tabel_set_entry(future,gdim,nowrow,nowcol,1);//change the entry in the storage table
               } //else do nothing
               //now we are done with this cell
            } //move on to the next case!!
            else { //the cell is ALIVE
            // three more cases here
            // ignore the case where the cell continues to live
               if ((num_al(gametable,gdim,nowrow,nowcol) != 2) || (num_al(gametable,gdim,nowrow,nowcol) != 3)) {
                  tabel_set_entry(future,gdim,nowrow,nowcol,1); //kill the cell in the future table
               } 
            }//now we are done with both cases, next cell
         }
      }//now we are done with the current state; copy future onto gametable!
      table_copy(future, gametable,gdim); //now gametable is ready for printing!
      print_bit_pattern (gametable, gdim, window_size);
      printf("%d\n",gen); //how many evolutions
      //now we are ready for the next evolution.
   }
}
      
