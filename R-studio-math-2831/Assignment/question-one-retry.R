# load data
Town=c(1,2,3,4,5,6,7,8,9,10,11,12)
Robberies=c(643,754,582,700,518,668,630,510,801,564,570,511)
Police=c(59,55,64,53,79,66,63,90,50,80,89,68)
TownData=data.frame(Town, Police, Robberies)

# plot regression 
plot.robberies.police <- plot(Police, Robberies)
reg.robberies.police <- lm(Robberies ~ Police)
abline(reg.robberies.police)


# estimates
summary(reg.robberies.police)

# confidence interval for increase in 10 
newdata = data.frame(Police = 10)
prediction <- predict(reg.robberies.police, Robberies = -57.35, interval = "confidence" ,level= 0.98)
pi <- predict(model, newdata = newdata, interval = "prediction", level = 0.95)
cat("Prediction:", prediction[1], "\n")
cat("95% Confidence Interval:", prediction[2], "to", prediction[3], "\n")

# Attempt 1 - Wrong 
predicted.expectaiton = 1010.897 + 10*(-5.735)
estimator.sigma = 58.83
N = dim(TownData)[1]
mean.police <- mean(Police)
t_critical <- qt(0.99, N - 2) 
Sxx <- sum((Police - mean.police)^2)
se.mean.response <- estimator.sigma * sqrt(1/N + ((10 - mean.police)^2) / Sxx)
ci <- c(predicted.expectaiton + t_critical*(se.mean.response),predicted.expectaiton - t_critical*(se.mean.response))
ci


# 1% level f-statistic
anova.robberies.police <- anova(reg.robberies.police)
anova.robberies.police
pvalue <- 1 - pf(66899/3461, 1, 10)
pvalue

# level 1% level t-test
# whats the point of (a) ? t.obs <- -4.397
df = 10
t.critical.one.sided <- qt(0.01, df)
t.critical.one.sided
pvalue.t.test <- pt(t.critical.one.sided, df)
pvalue.t.test

# what am i doing up there?
t_value <- -4.397
# p-value = P(T < )




# predict 
predict.eightfour.police <- predict(reg.robberies.police, data.frame(Police = c(84)))

# ci/pi confidence interval 98%
newdata <- data.frame(Police = 84)
ci <- predict(reg.robberies.police, newdata ,interval="confidence", level=0.98)
pi <- predict(reg.robberies.police, newdata ,interval="prediction", level=0.98)

# Bonferroni adjustment B0 and B1 98% CI 
confint(reg.robberies.police,level=0.99)

# residual vs fitted model 
res.fit <- plot(reg.robberies.police, which=1)

# QQplot vs Normal plot
qqplot.mod <- plot(reg.robberies.police, which=2) 






