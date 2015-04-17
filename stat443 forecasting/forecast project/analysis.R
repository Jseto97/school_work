# basic analysis
trt<-read.table("trt(f).txt",header=T)
ts.plot(trt$temp,ylab="Tempreture") # overall plot
dat<-data.frame(date=as.Date(trt$date),temp=trt[2][,1]) ## convert date from factor to date frame.
library(xts,quietly=T)
dat.xts<-xts(x=dat$temp,order.by=dat$date)
mavg<-apply.monthly(dat.xts,mean)
plot(mavg[2:(length(mavg)-1)],main="monthly average",xlab="Time",ylab="Tempreture") ## first and last months are not complete, so removed
yavg<-apply.yearly(dat.xts,mean)
plot(yavg[2:19],main= "year average") # to see the trend other than seasonality
trt.train<-trt[2][,1][1:6570]
trt.test<-trt[2][,1][6571:7300] # split train and test set
rm(dat,dat.xts,mavg,yavg)

# regression models
fa=NULL # create a factor for month indicator
jan=rep(1,31)
feb=rep(2,28)
mar=rep(3,31)
apr=rep(4,30)
may=rep(5,31)
jun=rep(6,30)
jul=rep(7,31)
aug=rep(8,31)
sep=rep(9,30)
oct=rep(10,31)
nov=rep(11,30)
dec=rep(12,31)
for (i in 1:21)
{
  fa=c(fa,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec)
}
fa = fa[64:7363]
mon=as.factor(fa)
mon.train<-mon[1:6570]
mon.test<-mon[6571:7300]
rm(mon,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec,i,fa)
reg1<-lm(trt.train~mon.train) # first regression - only about seasonality
summary(reg1)
resdiags <- function(res)
{
  par(mfcol=c(2,2)) # splits the view to show 4 plots
  ts.plot(res) # time series plot of residuals
  points(res) # points to make counting runs easier
  abline(h=mean(res)) # mean line
  qqnorm(res) #qq plot
  qqline(res)
  acf(res) #acf
  acf(res, type="partial") #pacf
}
resdiags(reg1$residuals)

# fit the linear trend
yff<-rep(1995,302)
for (i in 1:19){
    yff<-c(yff,rep((i+1995),365))
}
yff<-c(yff,rep(2015,63))
yf.train<-yff[1:6570]
yf.test<-yff[6571:7300]
reg2<-lm(trt.train~yf.train+mon.train)
rm(yff,i)
summary(reg2)
resdiags(reg2$residuals)
# the plots are not quite improved. But if we construct HT it will pass the test, so we should add the year term.
# sqrt transformation
rm(reg1)
ysr<-sqrt(yf.train)
reg3<-lm(trt.train~yf.train+ysr+mon.train)
summary(reg3)
resdiags(reg3$residuals)# not quite good
rm(ysr,reg3)
# log transformation
yrl<-log(yf.train)
reg4<-lm(trt.train~yf.train+yrl+mon.train)
summary(reg4)
resdiags(reg4$residuals) #not improved
rm(reg4,yrl)

# linear month model
t<-time(trt$date)
t.train<-t[1:6570]
t.test<-t[6571:7300]
fit<-lm(trt.train~t.train+mon.train)
summary(fit)
resdiags(fit$residuals)
library(lawstat)
runs.test(fit$residuals)
library(randtests)
difference.sign.test(fit$residuals)
turning.point.test(fit$residuals)

# try to add day factors into the regression model
a=c(1:31)
b=c(1:30)
c=c(1:28)
days=c(a,c,a,b,a,b,a,a,b,a,b,a)
for (i in 1:21){
  days=c(days,days)
}
days = days[64:7363]  #warning: if your computer has 4GB memory, it might not be able to run 
rm(a,b,c)
days.train=days[1:6570]
days.test=days[6571:7300]
reg6<-lm(trt.train~days.train+mon.train+yf.train)
summary(reg6)
resdiags(reg6$residuals)
dayf<-as.factor(days.train)
reg7<-reg6<-lm(trt.train~dayf+mon.train+yf.train)
summary(reg7)
resdiags(reg7$residuals)
## doesn't look much improved, so discard this part
rm(days,days.train,days.test,reg6,dayf,reg7,i)

# sqrt transformation
t2<-sqrt(t.train)
reg8<-lm(trt.train~t.train+t2+mon.train)
summary(reg8)
resdiags(reg8$residuals) #not quite good
rm(t2,reg8)

# use fit, the linear model to make the predictions in testing set
fit.pre<-predict(fit,newdata=list(t.train=t.test,mon.train=mon.test),interval="prediction")
pre.result<-(trt.test>fit.pre[,"lwr"] & trt.test<fit.pre[,"upr"])
table(pre.result) #88.77% of test data is in 95% predicted interval
plot(t.test,trt.test)
points(t.test,fit.pre[,1],col="red")
segments(t.test,fit.pre[,2],t.test,fit.pre[,3],col="blue")
plot(trt.test,ylab="Temprature",xlab="Time",main="Linear Model Prediction")
points(trt.test)
points(fit.pre[,"fit"], type="l", col="red")
points(fit.pre[,"lwr"], type="l", col="orange")
points(fit.pre[,"upr"], type="l", col="orange")

# prediction for the forecast
tnew=c(7300:7326)
monew=as.factor(rep(3,27))
fp<-predict(fit,newdata=list(t.train=tnew,mon.train=monew),interval="prediction")
fp #display the estimated value and prediction interval

# time series fit
## HW model(add)
trt.add<-HoltWinters(trt.ts,seasonal="add")
trt.add$SSE
PI.add<-predict(trt.add,730,prediction.interval=TRUE)
PI.add
plot(trt.testts)
points(trt.testts)
points(PI.add[,1], type="l", col="red")
points(PI.add[,2], type="l", col="orange")
points(PI.add[,3], type="l", col="orange")
# because there is value 0 in the data, we cannot use multiplicative Holt Winters Model

## SARIMA
trt.ts<-ts(trt.train,start=c(1995,64),frequency=365)
trt.testts<-ts(trt.test,start=c(2013,64),frequency=365)
library(forecast)
par(mfcol=c(1,1))
## we can see there is a yearly seasonality in this series.
resdiags(trt.ts)
## too bad, try some differencing
resdiags(diff(trt.ts,diff=3))
## qq plot and acf look better.
resdiags(diff(trt.ts,lag=365))
## pacf is better, but acf is worse, try more difference
resdiags(diff(diff(trt.ts,lag=365),diff=5))
## looks good. try arima(9,0,3)
trt.try<-diff(diff(trt.ts,lag=365),diff=5)
mod1<-arima(trt.try,order=c(9,0,3),method="ML")
resd<-function(m){
  par(mfcol=c(2,2))
  plot(m$residuals)
  abline(h=mean(m$residuals))
  qqnorm(m$residuals)
  qqline(m$residuals)
  acf(m$residuals)
  acf(m$residuals,type="partial")
}
resd(mod1)
## too bad, try auto.arima
rm(mod1)
auto.arima(trt.try)
## get arima(3,0,4)
mod2<-arima(trt.try,order=c(3,0,4),method="ML")
resd(mod2)
## too bad, so we just need one diff
rm(mod2)
trt.diff<-diff(trt.ts,lag=365)
## difference with lag 365 (yearly seasonality)
mod3<-arima(trt.diff,order=c(3,0,9),method="ML")
## do residuals diagnose
resd(mod3)
## good. try other model
auto.arima(trt.diff)
## find arima(p,d,q), get (2,0,2)
mod4<-arima(trt.diff,order=c(2,0,2),method="ML")
resd(mod4)
## looks perfect, just q-q plot have heavy tails.
## predict for next 2 year, test it.
pred.mod4<-predict(mod4,n.ahead=730,se.fit=TRUE)
par(mfcol=c(1,1))
plot(trt.testts)
points(trt.testts)
points(pred.mod4$pred, type="l", col="red")
points(pred.mod4$pred + 1.96*pred.mod4$se, type="l", col="orange")
points(pred.mod4$pred - 1.96*pred.mod4$se, type="l", col="orange")

#arima residual
auto.arima(fit$residuals)
## get arima(2,0,2)
res.arma <- arima(fit$residuals, order=c(2,0,2), method="ML")
resdiags(res.arma$residuals)
X <- model.matrix(fit)[,2:12]
reg.arma <- arima(trt.train, order=c(2,0,2), xreg=X, method="ML")
resdiags(reg.arma$residuals)
## prediction
newX <- model.matrix(fit)[1:730,2:12]
newX[,1]=newX[,1]+6570
newXpred.arma <- predict(reg.arma, n.ahead=730, newxreg=newX, se.fit=TRUE)
par(mfcol=c(1,1))
t=c(6571:7300)
plot(t,trt.test)
points(trt.test)
points(newXpred.arma$pred, type="l", col="red")
points(newXpred.arma$pred + 1.96*newXpred.arma$se, type="l", col="orange")
points(newXpred.arma$pred - 1.96*newXpred.arma$se, type="l", col="orange")

# ARCH
library(tseries)
trt.arch=garch(fit$residuals,order=c(0,1),trace=F)
resi = trt.arch$residuals[2:]
qqnorm(trt.arch$residuals)
qqline(trt.arch$residuals)
rsqr = resi^2
acf(rsqr)
pacf(rsqr)
acf(resi)
pacf(resi)

trt.arch=garch(resi,order=c(0,2),trace=F)
resi = trt.arch$residuals[2:]
qqnorm(trt.arch$residuals)
qqline(trt.arch$residuals)
rsqr = resi^2
acf(rsqr)
pacf(rsqr)
acf(resi)
pacf(resi) #no big improvement, try garch models

#garch
trt.garch=garch(resi,order=c(1,1),trace=F)
res = trt.garch$residuals
qqnorm(res)
qqline(res)
acf(res[2:6569])
pacf(res[2:6569])

trt.garch=garch(resi,order=c(1,2),trace=F)
res = trt.garch$residuals
qqnorm(res)
qqline(res)
acf(res[3:6569])
pacf(res[3:6569]) # no big difference between the models, and the plots still look not stationary