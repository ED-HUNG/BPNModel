library(readr)
dat <- read.csv("C:/Users/edwardhung/Desktop/m2.csv")
#====data loading
library(neuralnet)
nn  <- neuralnet(cam ~., dat, hidden = c(3, 2), linear.output = FALSE)
#====build model
avgDat<- dat[1,]
for (cname in names(dat)) {
  avgDat[1,cname] <- mean(dat[,cname])
}
newData<- avgDat
optFunc <- function(x) {
  newData$accLight[1] <- x[1]
  newData$accMotor[1] <- x[2]
  return(predict(nn, newData))#return生長情況
}
res <- optim(par=c(avgDat$accLight, avgDat$accMotor), fn=optFunc, method = "SANN")
#====optimization
res
sprintf("fun(%.4f,%.4f) = %.4f",res$par[1],res$par[2],res$value)
