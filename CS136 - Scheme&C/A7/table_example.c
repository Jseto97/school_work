#include "table.h"
#include <stdio.h>


// Sample program that uses table.h
int main(void) {

  struct dimension dim = { 10, 5 };

  // Create a table with 10 rows and 5 columns
  int table[table_get_size(&dim)];

  // Clear the table to ensure it contains all zero entries.
  table_clear(table, &dim);

  // Set some entries in the table:
  table_set_entry(table, &dim, 0, 1, 1);
  table_set_entry(table, &dim, 1, 0, 1);
  table_set_entry(table, &dim, 2, 2, 1);
  table_set_entry(table, &dim, 3, 3, 1);

  // Define a rectangle that has a top left corner in cell (0,0) and
  // is 4 rows high, and 5 columns wide.
  struct dimension window_size = {4, 5};
  struct rectangle window = { 0, 0, window_size };

  // Print out the contents of the cells contained in the rectangle
  // window: cells containing zero are printed as a ' ', and cells
  // containing a non-zero are printed as an 'X'.  There is a border
  // around the output.
  print_bit_pattern(table, &dim, &window);
}
