middle_square = function(num,iteration=20) {
  lst = c(num)
  for (i in 1:iteration) {
    sqr = paste("0000000",num^2,sep='')
    l = nchar(sqr)
    if (l>8)
      sqr = substr(sqr,l-7,l)
    num = as.integer(substr(sqr,3,6))
    lst = c(lst,num)
  }
  lst
}