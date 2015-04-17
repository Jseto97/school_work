MM1 <- function(A,S,n){
  t = 0 #system clock
  td = Inf #next departure time
  ta = A[1] #next arrival time
  na = 0 #number of people arrived
  nd = 0 #number of people departured
  N = 0 #number of people in Q
  taq = c() #vector of arrival times for people in Q
  D = c() #vector of delay time for each people
  TD = 0
  while (na<n) {
    if (ta<td) { # arrival event
      na = na+1 
      N = N+1
      t = ta
      ta = t+A[na]
      if (N==1) {
        td = t+S[nd+1]
      } else {
        N = N+1
        taq = c(taq,ta)
      }
    } else if (ta>td) {
      nd = nd+1
      N = N-1
      t = td
      if (N>0){
        td = t+S[nd]
        TD = TD + (t-taq[1])
        D = c(D,(t-taq[1]))
        taq = taq[2:length(taq)]
      } else {
        td = Inf
      }
    }
  }
  return (D)
}
