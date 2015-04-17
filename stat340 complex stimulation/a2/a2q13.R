LCG = function(num,iteration=20){
  lst = c(num)
  for (i in 1:iteration){
    num = (5*num+3)%%16
    lst = c(lst,num)
  }
  lst
}
LCG(7)
