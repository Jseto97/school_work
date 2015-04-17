z1=rnorm(100,0,50)
t=1:100
x1=22-15*t+0.3*t^2+z1
acf(x1)

z2=rnorm(101,0,1)
x2=rep(0,101)
for (t in 2:101) {
  x2[t] = x2[t-1] + z2[t]
}
acf(x2)

z3=rnorm(100,0,2)
t=1:100
x3=22-1.5*t+0.01*t^2+5*sin(2*t)+z3
acf(x3)

x4=sin(t)
acf(x4)

z5=rnorm(100,0,0.5)
x5=sin(t)+z5
acf(x5)

z6=rnorm(100,0,1)
x6=sin(t)+z6
acf(x6)

z7=rnorm(100,0,2)
x7=sin(t)+z7
acf(x7)