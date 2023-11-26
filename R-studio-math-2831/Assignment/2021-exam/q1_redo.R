mpg=c(20.5,20.3,23.0,20.1,17.3,17.3,13.9,24.2,26.6,19.3,17.5,14.9,18.6,14.7,14.2,12.1,15.9,32.0,30.6,31.1,21.4,14.4,14.7,11.6,19.2,28.0,27.4,32.4,13.2,18.9,12.4,22.7)
disp=c(129.7,152.0,11.6,234.8,328.3,230.1,381.9,146.8,174.5,193.1,147.1,304.3,251.3,266.3,442.0,436.4,461.2,43.6,118.2,65.3,79.7,306.4,329.0,336.6,385.7,108.5,162.9,101.0,347.3,141.0,292.5,105.7)
log.mpg=c(3.02,3.01,3.14,3.00,2.85,2.85,2.63,3.19,3.28,2.96,2.86,2.70,2.92,2.69,2.65,2.49,2.77,3.47,3.42,3.44,3.06,2.67,2.69,2.45,2.95,3.33,3.31,3.48,2.58,2.94,2.52,3.12) 
log.disp=c(4.87,5.02,2.45,5.46,5.79,5.44,5.95,4.99,5.16,5.26,4.99,5.72,5.53,5.58,6.09,6.08,6.13,3.78,4.77,4.18,4.38,5.72,5.80,5.82,5.96,4.69,5.09,4.62,5.85,4.95,5.68,4.66) 
cars=data.frame(mpg,disp,log.mpg,log.disp)

model <- lm(mpg ~ disp, data=cars)
plot(disp,mpg)
abline(model)

log.model <- lm(log.mpg ~ log.disp, data=cars)
plot(log.disp,log.mpg)
abline(log.model)

par(mfrow = c(2,2))
plot(model)
plot(log.model)

summary(log.model)
help(predict.lm)
new = 
CI <- predict(log.model,interval = "confidence", level = 0.97)
plot(CI)

cars$dummy = c(rep(0,24), 1 , rep(0,7))
cars
reffited.log.model <- lm(log.mpg ~ log.disp + dummy, data=cars)
summary(reffited.log.model)

rstudent(log.model)
tvalue <-  0.98410122
df <- 32 - 2 - 1
pvalue<- 2 * (1 - pt(abs(tvalue), df))
pvalue
