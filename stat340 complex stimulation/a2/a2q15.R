cPRNG = function(mass,output,iteration=100000){
  u = runif(iteration)
  x = c()
  for (num in u){
    cum = 0
    for (i in 1:length(mass)){
      cum = cum+mass[i]
      if (num<cum){
        x = c(x,output[i])
        break
      }
    }
  }
  x
}

PRNG = function(mass,output,population){
  findInterval(runif(population),cumsum(mass))+1
}