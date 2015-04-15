// pi_approximation.h

struct rational {
    int num;
    int denom;
};

// approximate_pi(x) finds values of a and b such that a/b approximates the value of pi
//                   with each iteration, values of a and b are refined to produce a better approximation
// PRE: 0 <= x <= 8, where x is a number of performed iterations
// POST: returns a rational a/b
//       prints the contents of the stack frame (in alphabetical order) for approximate_pi after:
//          - the initial setup of the algorithm
//          - each iteration of the algorithm
//       formatting of the stack frame (omitting leading '//' and whitespace characters)
//	 (Note: you do not have to provide a return address.)
//       ******************
//       * a:          24 *
//       *        .       *
//       *        .       *
//       *        .       *
//       * x:           1 *
//       ******************
struct rational approximate_pi(int x);
