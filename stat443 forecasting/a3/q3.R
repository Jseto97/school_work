acc.all<-USAccDeaths
acc.train<-ts(acc.all[1:60],start=c(1973,1),frequency=12)
acc.test<-ts(acc.all[61:72],start=c(1978,1),frequency=12)
plot(acc.train)
