
# Examples One
hospital <- read.table("../data/hospital.txt",header = TRUE)
hospital

#fit a model to all the data
#find the within sample prediction error (residual) for the 3rd observation
#fit model without the third data point
#predict using predictors for third data point only
#find the out of sample prediction error (PRESS residual)
model <- lm(y ~ x1 + x2 + x3 + x4 + x5, data=hospital)
residuals(model)
e3 <-  -70.83378  
model.without.3rd <-  lm(y ~ x1 + x2 + x3 + x4 + x5, data=hospital[-3,])
summary(model)
summary(model.without.3rd)
nd <- hospital$y[3]
nd
e3m3 <- hospital$y[3,] - predict(hospital[-3], newdata=nd)
help(predict)
