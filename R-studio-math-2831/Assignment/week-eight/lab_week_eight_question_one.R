
compensation=data.frame(compensation)

model <- lm(compensation$Compensation ~., data=compensation)
summary(model)

# assumption of model error(i) ~ N(0, simag^2) 

plot(model)
 
# b 
# plot the leverages
dotchart(hatvalues(model))
dotchart(rstudent(model))
# finding high resitual 
alpha <- 0.025
df <- 28
critical.value.t <- qt(1 - alpha/2, df)
critical.value.t

# all measurements
influence.measures(model)
plot(model, which=4)

help(qf)
qf(0.5,4, 29)
plot(compensation$Profits~compensation$Compensation)
model.two <- lm(compensation$Compensation~compensation$Profits)
plot(compensation$Profits, compensation$Compensation)
abline(model.two)
dotchart(hatvalues(model.two))
summary(model.two)

#d
model.two.refit <- lm(Compensation~Profits, data=compensation[-25,])
compensation[c(25)]
plot(compensation$Compensation~compensation$Profits, data=compensation[-25,])
summary(model.two.refit)
abline(model.two.refit)
abline(model.two)

#e
model.three <- lm(Compensation~log(Profits), data=compensation)
plot(log(compensation$Profits), compensation$Compensation, data=compensation)
abline(model.three)
plot(model.three, plot=c(3,4,5))
influence.measures(model.three)
qf(0.5, 2,31)
