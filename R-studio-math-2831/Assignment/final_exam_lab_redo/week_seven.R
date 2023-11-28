
# Question 1 
library(leaps)
data <- read.table("../data/biomass.txt",header = T)
model <- lm(y ~ x1 + x3 + x2 + x4, data=data)
Cp=leaps( x=data[,2:5], y=data$y, names=names(data)[2:5],
          method="Cp")
r2=leaps( x=data[,2:5], y=data$y, method="r2")
adjr2=leaps( x=data[,2:5], y=data$y, method="adjr2")
cbind(Cp$which,R2 = r2$r2, AdjR2 = adjr2$adjr2,
      MallowCp = Cp$Cp,p = Cp$size)
summary(model)
variance_fullmodel <- (101.7)^2
best_model <- lm(y ~ x1 + x4, data=data)
summary(best_model)
variance_bestmodel <- (102.9)^2
n <- 10
p <- 3
Cp_calcualted <- p + (7*(variance_bestmodel - variance_fullmodel))/variance_fullmodel
Cp_calcualted
# yes same!

PRESS <- function(linear.model) {
  pr <- residuals(linear.model)/(1 - lm.influence(linear.model)$hat)
  sum(pr^2)
}
model_second_best <- lm(y ~ x1 + x2 + x4, data=data)
PRESS(best_model) # 488928.9
PRESS(model) # 482210.5
# since model with has lower PRESS has more predictive power in this case the better model is full model 

# b 
# using adjusted R^2 best model is y ~ x1 + x2 + x4 

# Question 2 
#install.packages("MASS")
library(MASS)
riskdat <- read.table("../data/risk.txt",header = T)
null <-lm(risk~1,data=riskdat)
full <-lm(risk~.,data=riskdat)
stepAIC(null, scope = list(lower = null, upper = full),
        direction = "forward")

stepAIC(full, scope = list(lower = null, upper = full),
        direction = "backward")


