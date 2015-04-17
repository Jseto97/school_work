RANDU = function(num,iteration=2000){
  lst = c()
  base = 2^31
  for (i in 1:iteration){
    num = ((2**16+3)*num)%%base
    lst = c(lst,num/base)
  }
  lst
}

result=RANDU(123456)
plot(result)
qqnorm(result)
qqline(result)
