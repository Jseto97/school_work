// table.h

// dimension: Specifies the dimensions of a table in terms of number
// of rows (num_row) and number of columns (num_col).  A dimension
// struct is VALID for a table t if num_row and num_col are positive
// numbers that match the number of rows and columns in t.  A table
// entry, or cell, denoted (r, c) is VALID for table t if:
//       0 <= r < num_row 
// and 
//       0 <= c < num_col .
struct dimension {
  int num_row;
  int num_col;
};


// rectangle: Specifies rectangular range of cells within a table.  A
// rectangle is VALID for a table t if the cells (start_row,
// start_col) and (start_row + size.num_row - 1, start_col +
// size.num_col - 1) are valid cells in t.
struct rectangle {
  int start_row;
  int start_col;
  struct dimension size;
};


// table_get_size(dim): Returns the number of cells in a table with
// dimensions *dim.
// 
// PRE:  dim is not NULL, and *dim is valid (see struct dimension)
// 
// POST: return a positive integer.
// 
// TIME: O(1)
int table_get_size(const struct dimension *dim);


// table_set_entry(t, dim, row, col, v): Sets the value of the
// specified table cell.
//
// PRE: t and dim are not NULL, *dim is valid for table t, the cell
//      (row, col) is valid in t.
//
// POST: sets the cell (row, col) in table t to store value v.
//
// TIME: O(1)
void table_set_entry(int t[], 
		     const struct dimension *dim,
		     const int row, 
		     const int col, 
		     const int v);


// table_get_entry(t, dim, row, col): Returns the value of the
// specified table cell.
// 
// PRE:  t and dim are not NULL, and *dim is valid for table t.
// 
// POST: returns the value stored in cell (row, col) in table t.
// 
// TIME: O(1)
int table_get_entry(const int t[], 
		    const struct dimension *dim,
		    const int row, 
		    const int col);


// table_clear: zeros out all the cells in table t.
// 
// PRE:  t and dim are not NULL, and *dim is valid for table t.
//
// POST: all cells in t are set to store 0
//
// TIME: O(n)
// inner loop: summation[j=0 to num_col] O(1)=O(num_col)
// outer loop: summation[i=0 to num_row] O(1)=O(num_col x num_row)=O(n)
// where n = num_col x num_row, the size of the given dimension dim
void table_clear(int t[], const struct dimension *dim);


// table_copy: Copies the contents of table a to table b.
//
// PRE: a, b, and dim are not NULL, and *dim is valid for tables a and
//      b: tables a and b have the same dimensions.
//
// POST: the values stored in the cells of b are equal to those of a
//
// TIME: O(n)
// inner loop: summation[j=0 to num_col] O(1)=O(num_col)
// outer loop: summation[i=0 to num_row] O(1)=O(num_col x num_row)=O(n)
// where n = num_col x num_row, the size of the given dimension dim
void table_copy(const int a[], int b[], const struct dimension *dim);


// print_bit_pattern(t, dim, win): Displays the rectangular range of
// cells of table t, specified by the rectangle win, to stdout in a
// neatly formatted manner.  If a cell contains a 0, then a space is
// printed to represent the cell.  If the cell contains any other
// value, the letter 'X' is printed.  A border is also printed around 
// the table.
//
// PRE:  t, dim, and win are not NULL.  *dim is a valid dimension for t, 
//       and *win is a valid rectangle for t.
//
// POST: See example files "table_example.c" and "table_example2.c"
//       on the assignment webpage for output examples.
//
// TIME: O(n)
// inner loop: summation[j=0 to num_col] O(1)=O(num_col)
// outer loop: summation[i=0 to num_row] O(1)=O(num_col x num_row)=O(n)
// where n = num_col x num_row, the size of the given rectangle win
void print_bit_pattern(const int t[], 
		       const struct dimension *dim, 
		       const struct rectangle *win);


// read_bit_pattern(t, table_dim, start_row, start_col, input_dim): 
// Uses getchar to read a bit pattern from stdin into the table t.
// See example "table_example2.c" provided on assignment webpage.
//
// PRE: t, table_dim, and input_dim are not NULL.  *table_dim is valid
//      for t. The entry (start_row, start_col) is a valid cell in t.
//
// POST: *input_dim stores the dimensions of the bit pattern read into
//       t: that is, the number of rows and columns read from stdin.
//       The table t stores the bit pattern read in in the specified
//       cells. This function should use table_set_entry to set the value of
//       cells.  If the input from stdin is too big for the table-- for 
//       example, if the user attempts to set the value of an invalid 
//       cell-- then this should be caught by an assertion.  You can assume 
//       that only '0', '1', '\n', and EOF characters will be input through
//       stdin.
// 
// TIME: O(n)
// inner loop: summation[j=0 to num_col] O(1)=O(num_col)
// outer loop: summation[i=0 to num_row] O(1)=O(num_col x num_row)=O(n)
// where n = num_col x num_row, the size of the given dimension input_dim
void read_bit_pattern(int t[], 
		      const struct dimension *table_dim,
		      const int start_row,
		      const int start_col,
		      struct dimension *input_dim);
