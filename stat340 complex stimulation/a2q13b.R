MRG = function(past,curr,iteration=15){
  lst = c(curr)
  for (i in 2:iteration){
    temp = curr
    curr = (5*past+3*curr)%%100
    past = temp
    lst = c(lst,curr)
  }
  lst
}
MRG(23,66)